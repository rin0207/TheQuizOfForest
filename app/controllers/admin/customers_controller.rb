class Admin::CustomersController < ApplicationController
	def index
		@customers = Customer.all
		@customer = Customer.find(params[:id])
	end

	def show
		@customer = Customer.find(params[:id])
	end
end
