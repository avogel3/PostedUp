class SessionsController < ApplicationController
  expose(:user) { User.find_by_email(params[:email]) }

  def create
    if user && user.authenticate(params[:password])
      render json: user
    else
      render json: { errors: 'Invalid email or password.' }, status: :unprocessable_entity
    end
  end

  def destroy
  end

end
