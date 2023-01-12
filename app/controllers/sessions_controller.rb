class SessionsController < ApplicationController
  def new
  end

  def create
    customer = Customer.find_by(email: params[:email])
    if customer && customer.authenticate(params[:password])
      session[:customer_id] = customer.id
      render json: customer, status: :created
    else
      flash[:danger] = "Invalid email or password"
      redirect_to customers_login_path
    end
  end
   

  def destroy
    session[:customer_id] = nil
    redirect_to root_path
  end
end
