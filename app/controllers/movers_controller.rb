class MoversController < ApplicationController
   
    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response
    rescue_from ActiveRecord::RecordInvalid, with: :record_invalid
   
    def create
        mover = Mover.create!(mover_params)
        if mover.valid?
            session[:mover_id]=mover.id
            render json: mover, status: :created
        end
    end
    def index
        movers = Mover.all
        render json: movers, status: :ok
    end
    def show
        mover =Mover.find(params[:id])
        render json: mover, status: :ok
    end
      def auto_login_mover
        mover =Mover.find_by(id:session[:mover_id])
        render json: mover, status: :ok
    end

    def update
       mover = Mover.find(params[:id])
       mover.update(params.permit(:password))
       render json: mover, status: :ok
    end

    def destroy
        mover = Mover.find(params[:id])
        mover.destroy
        head :no_content
    end
    private
    def render_not_found_response
        render json: {error: "Mover Not Found"}, status: :not_found
    end

    def mover_params
        params.permit(:company_name,:email,:password, :password_confirmation)
    end
    def record_invalid(invalid)
        render json:{error: invalid.record.errors.full_messages}, status: :unprocessable_entity
    end
end
