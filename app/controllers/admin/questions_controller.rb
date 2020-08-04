class Admin::QuestionsController < ApplicationController
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
		@questions = Question.all.order(id: "DESC") #新しいものから表示
	end

	def edit
		@question = Question.find(params[:id])
	end

	def update
		@question = Question.find(params[:id])
		@question.update
		redirect_to admin_questions_path
	end

	private
	def question_params
		params.require(:question).permit(:content, :comment, :genre_id, choices_attributes: [:id, :sentence, :is_answer, :question_id])
	end
end
