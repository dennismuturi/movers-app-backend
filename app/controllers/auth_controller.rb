class AuthController < ApplicationController
    def create
    customer = Customer.find_by(email: params[:email])
    session[:customer_id] = customer.id
    render json: customer
    end

    def destroy
        session.delete :customer_id
        head :no_content
      end
      def create_mover
        mover =Mover.find_by(email: params[:email])
        session[:mover_id] = mover.id
        render json: mover
        end
end
