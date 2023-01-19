class ApplicationController < ActionController::Base
    include ActionController::Cookies
    skip_before_action :verify_authenticity_token
    helper_method :mover_params, :customer_params, :signin_mover, :signin_customer
    private
    def mover_params
      params.permit( :company_name, :email, :password, :password_confirmation)
    end
    def customer_params
      params.permit(:name, :email, :password, :password_confirmation)
    end

    def signin_mover(mover)
      token = JWT.encode({ parent_id: mover.id }, Rails.application.credentials.jwt_secret_key)
      render json: { token: token, parent: mover}, status: :ok
    end
    def signin_customer(customer)
      token = JWT.encode({ customer_id: customer.id }, Rails.application.credentials.jwt_secret_key)
      render json: { token: token, customer: customer.as_json()}, status: :ok
    end
end