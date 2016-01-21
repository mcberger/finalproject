class CommentsController < ApplicationController

  def new
    @comment = Comment.new
    @post = Post.find_by_id(params[:post_id])
    @title = @post.title
  end

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.create(comment_params)
    @comment.user = current_user
    if @comment.save
      flash[:notice] = "Your comment was created successfully."
      redirect_to @post
    else
      flash[:alert] = "There was a problem saving your comment."
      redirect_to new_comment_path
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @post = Post.find(params[:post_id])
    if @comment.destroy
      flash[:notice] = "Your comment was deleted successfully."
    else
      flash[:alert] = "There was a problem deleting your comment."
    end
    redirect_to post_path @post
  end

  private
  def comment_params
    params.require(:comment).permit(:text, :post_id, :user_id)
  end
end
