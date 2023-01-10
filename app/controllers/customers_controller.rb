class CustomersController < ApplicationController

    def index
        customers = Customer.all
        render json: customers
    end

    def show
        customer = find_customer
        render json: customer
    end

    def create
        Customer = Customer.create(customer_params)
        render json: customer, status: :created
    end

    def destroy
        Customer = Customer.find_by(id: params[:id])
        customer.destroy
    end

    def update
        customer = find_customer
        customer.update!(customer_params)
        render json: customer, status: :updated
    end

    private

    def customer_params
      params.permit :first_name, :last_name,  :password, :email
    end
  
    def render_unprocessable_entity_response(invalid)
      render json: { error: invalid.record.errors }, status: :unprocessable_entity
    end
  end

end
