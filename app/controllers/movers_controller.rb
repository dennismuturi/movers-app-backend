class MoversController < ApplicationController
   
    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response
   
    def create
        mover = Mover.create!(mover_params)
        render json: mover, status: :created
    rescue ActiveRecord::RecordInvalid => invalid
        render json: { errors: invalid.record.errors.full_messages }, status: :unprocessable_entity

    end
    
    def index
        movers = Mover.all
        render json: movers, status: :ok
    end
    def show
        mover =Mover.find(params[:id])
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
        params.permit(:company_name,:email,:password)
    end

end
