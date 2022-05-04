class CommentsController < ApplicationController
  def new
    @current_user = User.find(params[:user_id])
    @comment = Comment.new
  end

  def create
    @current_user = User.find(params[:user_id])
    @user_id = params[:user_id]
    @post_id = params[:post_id]
    comment = Comment.new(comment_params.merge(user_id: @current_user.id, post_id: @post_id))
    if comment.valid?
      comment.save
      flash[:alert] = 'Comment created'

    else
      flash[:notice] = 'Could not create comment'

    end
    redirect_to user_post_path(@user_id, @post_id)
  end

  private

  def comment_params
    params.require(:comment).permit(:text)
  end
end
