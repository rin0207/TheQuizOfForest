class Public::CustomersController < ApplicationController
	def show
		#@question = Question.where(customer_id:current_customer).order(id: "DESC")
		@customer = current_customer
		@question = @customer.questions.page(params[:page])
		#会員が作ったクイズを新しいものから一覧表示
	end

	def like
		@customer = current_customer
	end
end
