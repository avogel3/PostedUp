class UsersController < ApplicationController
  expose :user

  def create
    if user.save
      render json: { notice: 'User created.' }
    else
      render json: { errors: user.errors }, status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.permit(:email, :password, :password_confirmation)
  end
end
