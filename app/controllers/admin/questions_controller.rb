class Admin::QuestionsController < ApplicationController
	before_action :authenticate_admin!
	def new
		@question = Question.new
		4.times do |n|
			@question.choices.build #buildメソッド(newと似たようなもの)
	    end
	end

	def create
		@question = Question.new(question_params)
		if @question.save
			redirect_to admin_questions_path
		else
			redirect_back(fallback_location: root_path)
		end
	end

	def index
		@q = Question.ransack(params[:q])
		@genres = Genre.all
		@tags = Tag.all
		# もしURLに[:genre_id]が含まれていたら
        if params[:genre_id]
            # その[:genre_id]のデータをGenreから@genreに格納
            @genre = Genre.find(params[:genre_id])
            # @genreに紐付いたクイズを表示
            @question = @genre.questions.page(params[:page]).per(5).order(id: "DESC").where(is_allowed: "許可")
        elsif params[:tag_id]# tag_idがあれば
        	question_tags = QuestionTag.where(tag_id: params[:tag_id])
			question_ids = []
			question_tags.each do |question_tag|
			  question_ids.push(question_tag.question.id)
			end
			@question = Question.where(id: question_ids).page(params[:page]).per(5).order(id: "DESC").where(is_allowed: "許可")
        else
            @question = @q.result.page(params[:page]).per(5).order(id: "DESC").where(is_allowed: "許可")#検索結果を新しいものから表示
        end
	end

	def allow
		@q = Question.ransack(params[:q])
		@genres = Genre.all
		# もしURLに[:genre_id]が含まれていたら
        if params[:genre_id]
            # その[:genre_id]のデータをGenreから@genreに格納
            @genre = Genre.find(params[:genre_id])
            # @genreに紐付いたクイズを表示
            @question = @genre.questions.page(params[:page]).per(5).order(id: "DESC").where(is_allowed: "許可")
        elsif params[:tag_id]# tag_idがあれば
        	question_tags = QuestionTag.where(tag_id: params[:tag_id])
			question_ids = []
			question_tags.each do |question_tag|
			  question_ids.push(question_tag.question.id)
			end
			@question = Question.where(id: question_ids).page(params[:page]).per(5).order(id: "DESC").where(is_allowed: "許可")
        else
            @question = @q.result.page(params[:page]).order(id: "DESC").where(is_allowed: "許可待ち")#検索結果を新しいものから表示
        end
	end

	def search
		@q = Question.search(search_params)
		@genres = Genre.all
		@question = @q.result.order(id: "DESC")
	end

	def edit
		@question = Question.find(params[:id])
	end

	def update
		@question = Question.find(params[:id])
		@question.update(question_params)
		redirect_to admin_questions_path
	end

	private
	def question_params
		params.require(:question).permit(:image, :content, :comment, :genre_id, :is_allowed, choices_attributes: [:id, :sentence, :is_answer, :question_id])
	end
	def search_params
		params.require(:q).permit!
	end
end
