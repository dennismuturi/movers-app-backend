class CustomersController < ApplicationController

    def index
        customers = Customer.all
        render json: customers
    end

    def show
        customer = find_customer
        render json: customer
    end

    private

    def customer_params
      params.permit :first_name, :last_name,  :password, :password_confirmation, :email
    end
  
    def render_unprocessable_entity_response(invalid)
      render json: { error: invalid.record.errors }, status: :unprocessable_entity
    end
  end

end
