class Api::PostsController < ApplicationController
  skip_before_filter :verify_authenticity_token
  expose(:posts) { Post.order(updated_at: :desc).page params[:page] }

  def index
    render json: posts
  end
end
