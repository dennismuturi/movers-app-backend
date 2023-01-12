class Movers::SessionsController < ApplicationController
     def create
    mover = Mover.find_by(email: params[:email])
    if mover&& mover.authenticate(params[:password])
      session[:mover_id] = mover.id
      render json: mover, status: :created
    end
  end
end
