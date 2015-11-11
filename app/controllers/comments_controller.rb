class CommentsController < ApplicationController

  def new
    @comment = Comment.new
  end

  def edit

  end

  def create
    @comment = Comment.new(comment_params)
    @comment.user = current_user
    @comment.save
    redirect_to :back
  end

  private
    def comment_params
      params.require(:comment).permit(:user_id, :link_id, :comment_id, :content)
    end
end
