class CustomersController < ApplicationController
        rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response
        rescue_from ActiveRecord::RecordInvalid, with: :record_invalid
   
    def create
        customer = Customer.create!(customer_params)
        if customer.valid?
            session[:customer_id]=customer.id
            render json: customer, status: :created
        end
        rescue ActiveRecord::RecordInvalid => invalid
        render json: { errors: invalid.record.errors.full_messages }, status: :unprocessable_entity 
    end
    
    def index
        if params[:admin_id]
            admin = Admin.find(params[:admin_id])
            customers =admin.customers
            movers = admin.movers
        else
        customers = Customer.all
        end
        render json: customers, status: :ok
    end
    def show
        
        customer = Customer.find(params[:id])
        render json: customer,Serializer:CustomerSerializer 
    end

    def destroy
        customer = Customer.find_by(id: params[:id])
        customer.destroy
        head :no_content
    end

    def update
        customer.update!(customer_params)
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
        params.permit(:name,:email,:password, :password_confirmation,:phone_number)

    end
    def record_invalid(invalid)
        render json:{error: invalid.record.errors.full_messages}, status: :unprocessable_entity
    end



def render_not_found_response
      render json: {error: "Customer Not Found"}, status: :not_found
  end

  end

