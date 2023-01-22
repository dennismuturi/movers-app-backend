class CustomerOrdersController < ApplicationController

    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response
   
    def create
        order = CustomerOrder.create!(customer_order_params)
        render json: order, status: :created
    rescue ActiveRecord::RecordInvalid => invalid
        render json: { errors: invalid.record.errors.full_messages }, status: :unprocessable_entity

    end
    
    def index
        orders = CustomerOrder.all
        render json: orders, status: :ok
    end

    def show
        order =CustomerOrder.find(params[:id])
        render json: order, status: :ok
    end

    def update
       order = CustomerOrder.find(params[:id])
       order.update(customer_order_params)
       render json: order, status: :ok
    end

    def destroy
        order = order.find(params[:id])
        order.destroy
        head :no_content
    end

    
    private
    def render_not_found_response
        render json: {error: "Customer Order Not Found"}, status: :not_found
    end

    def customer_order_params
        params.permit(:order_date, :delivery_date, :customer_id, :mover_id, :price_id, :pickup, :destination)
    end
end
