class Api::PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]
  load_and_authorize_resource
  around_action :user_timezone, if: :current_user

  def index
    @posts = Post.where(post_status: :posted).order('updated_at DESC').page params[:page]
    render json: @posts
  end

  def show
    render json: @post
  end

  def edit
    render json: @post
  end

  def create
    @post = current_user.posts.new(post_params)

    if @post.save
      render json: @post
    else
      render json: { errors: @post.errors }, status: :unprocessable_entity
    end
  end

  def update
    if @post.update(post_params)
      render json: @post
    else
      render json: { errors: @post.errors }, status: :unprocessable_entity
    end
  end

  def destroy
    @post.destroy
    render json: { notice: 'Post deleted successfully.' }, status: :ok
  end

  def my_posts
    @posts = current_user.posts.order("updated_at DESC").page params[:page]
    render json: @posts
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.fetch(:post, {}).permit(:title, :content, :post_status, :posted_date, :image, :remove_image, :user_id)
    end

    def user_timezone
      Time.use_zone(current_user.preferred_timezone) { yield }
    end
end
