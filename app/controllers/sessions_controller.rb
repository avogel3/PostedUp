class SessionsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def create
    user = User.find_by_email(session_params[:email])
    if user && user.authenticate(session_params[:password])
      render json: { notice: 'Signed in.' }
    else
      render json: { errors: 'Invalid email or password.' }, status: :unprocessable_entity
    end
  end

  def destroy
  end

  private
  def session_params
    params.permit(:email, :password)
  end
end
