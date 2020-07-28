class Public::QuestionsController < ApplicationController
	def new
		@question = Question.new
		@question.choices.build #buildメソッド(newと似たようなもの)
	end

	def create
		@question = Question.new(question_params)
		@customer = current_customer
		@question.save
		redirect_to public_customer_path(@customer)
	end

	def index
		@question = Question.all.order(id: "DESC") #新しいものから表示
	end

	private
	def question_params
		params.require(:question).permit(:content, :comment, choice_attributes:[:id, :sentence, :is_answer])
	end
end
