class AdminsController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response
   
    def create
        admin = Admin.create!(admin_params)
        render json: admin, status: :created
    rescue ActiveRecord::RecordInvalid => invalid
        render json: { errors: invalid.record.errors.full_messages }, status: :unprocessable_entity

    end
    
    def index
        admin = Admin.all
        render json: admin, status: :ok
    end
    
    def show
        admin =Admin.find(params[:id])
        render json: admin, status: :ok
    end

    def update
    admin = Admin.find(params[:id])
    admin.update(params.permit(:password))
       render json:admin, status: :ok
    end

    def destroy
    admin = Admin.find(params[:id])
    admin.destroy
        head :no_content
    end

    private
    def render_not_found_response
        render json: {error: "Admin Not Found"}, status: :not_found
    end

    def admin_params
        params.permit(:first_name, :last_name, :email,:password, :customer_order_id)
    end
end
