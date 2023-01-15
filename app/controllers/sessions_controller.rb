class SessionsController < ApplicationController
  before_action :validate_mover_params, only: [:create_mover]
  
 
  def mover_login
    mover = Mover.find_by(email: params[:email])
    if mover&.authenticate(params[:password])
      signin_mover(mover)
    else
      render json: { error: 'Invalid username or password' }, status: :unauthorized
    end
  end
  def customer_login
    customer = Customer.find_by(email: params[:email])
    if customer&.authenticate(params[:password])
      signin_customer(customer)
    else
      render json: { error: 'Invalid username or password' }, status: :unauthorized
    end
  end
  def logout_mover
    session.delete(:mover_id)
    render json: { message: "Successfully logged out mover" }, status: :ok
  end
end