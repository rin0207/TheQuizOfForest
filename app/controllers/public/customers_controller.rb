class Public::CustomersController < ApplicationController
	def show
		@question = Question.where(customer_id:current_customer).order(id: "DESC")
		#会員が作ったクイズを新しいものから一覧表示
	end
end
