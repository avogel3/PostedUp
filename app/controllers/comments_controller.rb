class CommentsController < ApplicationController
  load_and_authorize_resource

  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      redirect_to post_path(comment_params[:post_id]), notice: 'Your comment has been posted!'
    else
      redirect_to post_path(comment_params[:post_id]), alert: @comment.errors.full_messages.to_sentence
    end
  end

  private

  def comment_params
    params.fetch(:comment, {}).permit(:content, :user_id, :post_id)
  end
end
