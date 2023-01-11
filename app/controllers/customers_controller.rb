class CustomersController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response

    def index
        customers = Customer.all
        render json: customers, status: :ok
    end

    def show
        customer = find_customer
        render json: customer,Serializer:CustomerSerializer status: :ok
    end

    def create
        Customer = Customer.create(customer_params)
        render json: customer, status: :created
    rescue ActiveRecord::RecordInvalid => invalid
        
    end

    def destroy
        Customer = Customer.find_by(id: params[:id])
        customer.destroy
        head :no_content
    end

    def update
        customer = find_customer
        customer.update!(customer_params)
        render json: customer, status: :ok
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
