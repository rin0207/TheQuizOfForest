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
		@question = Question.all.order(id: "DESC") #新しいものから表示
	end

	private
	def question_params
		params.require(:question).permit(:content, :comment, :genre_id, choice_attributes:[:id, :sentence, :is_answer])
	end
end
