module Api
  class PostsController < ApplicationController
    def index
      @posts = Post.where(post_status: :posted).order(updated_at: :desc).page(params[:page])
      render json: @posts
    end

    def show
      @post = Post.find(params[:id])
      render json: @post
    end
  end
end
