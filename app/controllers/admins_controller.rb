class AdminsController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :admin_not_found_response
    rescue_from ActiveRecord::RecordInvalid, with: :invalid_admin_details
   
    def create
        admin = Admin.create!(admin_params)
        render json: admin, status: :created
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

    def signup
        admin = Admin.create(params.permit(:first_name, :last_name, :email, :password))
        render json: admin, status: :created
    end

    def login
        admin = Admin.find_by(email: params[:email])
        if admin&.authenticate(params[:password])
            session[:admin_id] = admin.id
        render json: admin, status: :ok
        else  
            render json: {error: "invalid email or password"}, status: :unauthorized
        end
    end
    
    def signout
        admin = Admin.find(session[:user_id]).destroy
        head :no_content
    end 
    
    private
    def admin_not_found_response
        render json: {error: "Admin Not Found"}, status: :not_found
    end

    def admin_params
        params.permit(:first_name, :last_name, :email,:password, :customer_order_id)
    end

    def invalid_admin_details
        render json: { errors: invalid.record.errors.full_messages }, status: :unprocessable_entity
    end 
end
