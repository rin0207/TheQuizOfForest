class Public::QuestionsController < ApplicationController
	def new
		@question = Question.new
		4.times do |n|
			@question.choices.build #buildメソッド(newと似たようなもの)
	    end
	end

	def create
		@question = Question.new(question_params)
		if @question.save
			redirect_to public_customer_path(current_customer)
		else
			redirect_back(fallback_location: root_path)
		end
	end

	def index
		@q = Question.ransack(params[:q])
		@genres = Genre.all
		# もしURLに[:genre_id]が含まれていたら
        if params[:genre_id]
            # その[:genre_id]のデータをGenreから@genreに格納
            @genre = Genre.find(params[:genre_id])
            # @genreに紐付いたクイズを表示
            @question = @genre.questions.order(id: "DESC")#.where(is_allowed: "許可")
        else
            @question = @q.result.order(id: "DESC")#検索結果を新しいものから表示
        end
		
	end

	def search
		@q = Question.search(search_params)
		@genres = Genre.all
		@question = @q.result.order(id: "DESC")
	end

	private
	def question_params
		params.require(:question).permit(:content, :comment, :genre_id, :customer_id, choice_attributes: [:id, :sentence, :is_answer, :question_id])
	end
	def search_params
		params.require(:q).permit!
	end
end
