class Admin::CustomersController < ApplicationController
	before_action :authenticate_admin!
	def index
		@customers = Customer.all
	end

	def show
		@customer = Customer.find(params[:id])
		@question = Question.where(customer_id:@customer).order(id: "DESC")
	end
end
