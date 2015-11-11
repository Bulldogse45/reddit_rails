class CommentsController < ApplicationController

  def new
    @comment = Comment.new
  end

  def edit

  end

  def create
    @comment = Comment.new(comment_params)
    @comment.user = current_user
    unless @comment.save
      flash[:warning] = "You must be logged in to comment"
    end
    redirect_to :back
  end

  def show
    @comment = Comment.find(params['id'])
  end

  private
    def comment_params
      params.require(:comment).permit(:user_id, :link_id, :comment_id, :content)
    end
end
