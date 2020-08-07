class LikesController < ApplicationController
	before_action :set_question

    def create
      @like = Like.create(customer_id: current_customer.id, question_id: @question.id)
    end

    def destroy
      @like = Like.find_by(customer_id: current_customer.id, question_id: @question.id)
      @like.destroy
    end

    private
    def set_question
      @question = Question.find(params[:question_id])
    end
end
