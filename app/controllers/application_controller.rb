class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  prepend_before_filter :get_auth_token

  def current_user
    @current_user ||= User.find_by_auth_token(params[:auth_token]) if params[:auth_token]
  end
  helper_method :current_user

  private
  # todo: test that this actually renders this error.
  def authorize
    render json: { errors: 'Please log in.' }, status: :unprocessable_entity
  end

  def get_auth_token
    if auth_token = params[:auth_token].blank? && request.headers["X-AUTH-TOKEN"]
      params[:auth_token] = auth_token
    end
  end
end
