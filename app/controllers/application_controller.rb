class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  # todo: check for auth token in the response headers as well.
  def current_user
    @current_user ||= User.find_by_auth_token(params[:auth_token]) if params[:auth_token]
  end

  private
  # todo: test that this actually renders this error.
  def authorize
    render json: { errors: 'Please log in.' }, status: :unprocessable_entity
  end
end
