class SessionsController < ApplicationController  
 
  def mover_login
    mover = Mover.find_by(email: params[:email])
    if mover&.authenticate(params[:password])
      session[:mover_id] = mover.id
      render json: mover
    else
      render json: { error: 'Invalid username or password' }, status: :unauthorized
    end
  end
  def customer_login
    customer = Customer.find_by(email: params[:email])
    if customer&.authenticate(params[:password])
     session[:customer_id] = customer.id
      render json: customer
    else
      render json: { error: 'Invalid username or password' }, status: :unauthorized
    end
  end
  def logout_mover
    session.delete(:mover_id)
    render json: { message: "Successfully logged out mover" }, status: :ok
  end
    def logout_customer
    session.delete(:customer_id)
    render json: { message: "Successfully logged out customer" }, status: :ok
  end
end