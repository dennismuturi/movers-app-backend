class CustomersController < ApplicationController

    def index
        customers = Customer.all
        render json: customers
    end
    
    def show
        customer = find_customer
        render json: customer
    end


end
