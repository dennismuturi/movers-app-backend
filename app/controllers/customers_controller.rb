class CustomersController < ApplicationController
        rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response
        rescue_from ActiveRecord::RecordInvalid, with: :record_invalid
   
    def create
        customer = Customer.create!(customer_params)
        if customer.valid?
            session[:customer_id]=customer.id
            render json: customer, status: :created
        end
    end
    
    def index
        customers = Customer.all
        render json: customers, status: :ok
    end
    def show
<<<<<<< HEAD
        customer =Customer.find(params[:id])
=======
        customer = find_customer
        render json: customer,Serializer:CustomerSerializer 
    end

    def create
        customer = Customer.create(customer_params)
        render json: customer, status: :created
        rescue ActiveRecord::RecordInvalid => invalid
        render json: { errors: invalid.record.errors.full_messages }, status: :unprocessable_entity 
    end

    def destroy
        customer = Customer.find_by(id: params[:id])
        customer.destroy
        head :no_content
    end

    def update
        customer = find_customer
        customer.update!(customer_params)
>>>>>>> b7f8c6e (fixed customer post)
        render json: customer, status: :ok
    end

    def update
       customer = Customer.find(params[:id])
       customer.update(params.permit(:password))
       render json: customer, status: :ok
    end

    def destroy
        customer = Customer.find(params[:id])
        customer.destroy
        head :no_content
    end
    private
    def render_not_found_response
        render json: {error: "customer Not Found"}, status: :not_found
    end

    def customer_params
<<<<<<< HEAD
        params.permit(:username,:email,:password, :password_confirmation)
=======
      params.permit(:first_name, :last_name,  :password, :email) 
>>>>>>> b7f8c6e (fixed customer post)
    end
    def record_invalid(invalid)
        render json:{error: invalid.record.errors.full_messages}, status: :unprocessable_entity
    end
<<<<<<< HEAD
end
=======
  end


>>>>>>> b7f8c6e (fixed customer post)
