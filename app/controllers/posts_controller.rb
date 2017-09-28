class PostsController < ApplicationController
  before_action :set_post, only: %i[show edit update destroy]
  before_action :authenticate_user!, except: %i[index show]
  load_and_authorize_resource
  around_action :user_timezone, if: :current_user

  def index
    @posts = Post.where(post_status: :posted).order(updated_at: :desc).page(params[:page])
  end

  def show
    @comment = Comment.new
    @comments = @post.comments
  end

  def new
    @post = current_user.posts.new
  end

  def edit; end

  def create
    @post = current_user.posts.new(post_params)

    if @post.save
      redirect_to @post, notice: 'Post was successfully created.'
    else
      render :new
    end
  end

  def update
    if @post.update(post_params)
      redirect_to @post, notice: 'Post was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url, notice: 'Post was successfully deleted.' }
      format.json { head :no_content }
    end
  end

  def my_posts
    @posts = current_user.posts.order('updated_at DESC').page(params[:page])
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.fetch(:post, {}).permit(:title, :content, :post_status, :posted_date, :image, :remove_image, :user_id)
  end

  def user_timezone
    Time.use_zone(current_user.preferred_timezone) { yield }
  end
end
