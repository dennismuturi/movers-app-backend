class VehiclesController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response
   
    def create
        vehicle = Vehicle.create!(vehicle_params)
        render json: vehicle, status: :created
    rescue ActiveRecord::RecordInvalid => invalid
        render json: { errors: invalid.record.errors.full_messages }, status: :unprocessable_entity

    end
    
    def index
        if params[:mover_id]
            mover = Customer.find(params[:mover_id])
            vehicles = mover.vehicles
        else
        vehicles = Vehicle.all
        end
        render json: vehicles, status: :ok
    end
    def show
        vehicle = Vehicle.find(params[:id])
        render json: vehicle, status: :ok
    end

    def destroy
        vehicle = Vehicle.find(params[:id])
        vehicle.destroy
        head :no_content
    end

    private
    def render_not_found_response
        render json: {error: "vehicle Not Found"}, status: :not_found
    end

    def vehicle_params
        params.permit(:vehicle_name,
            :vehicle_type,
            :vehicle_color,
            :vehicle_number,
            :mover_id
        )
    end

end
