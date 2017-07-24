class Api::PostsController < ApplicationController
  skip_before_filter :verify_authenticity_token
  expose(:posts) { Post.order(updated_at: :desc).page params[:page] }
  expose(:post)

  def index
    render json: posts
  end

  def show
    render json: post
  end

  private
  def post_params
    params.permit(:id, :image, :title, :content, :posted_date)
  end
end
