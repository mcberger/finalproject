class PostsController < ApplicationController
  def index
    @posts = Post.joins(:user).where('users.establishment = ?', current_user.establishment)
    @title = "Q&A"
  end

  def show
    @post = Post.find(params[:id])
    @title = @post.title
  end

  def new
    @post = Post.new
    @title = 'New question'
  end

  def create
    @post = Post.new(post_params)
    @post.user = current_user
    if current_user != nil && @post.save
      flash[:notice] = "Your post was created successfully."
      redirect_to post_path @post
    else
      flash[:alert] = "There was a problem saving your post."
      redirect_to new_post_path
    end
  end

  def edit
    @post = Post.find(params[:id])
    @title = 'Edit: ' + @post.title
  end

  def update
    post = Post.find(params[:id])
    if post.update_attributes post_params
      flash[:notice] = "Your question was updated successfully."
      redirect_to post_path post
    else
      flash[:alert] = "There was a problem updating your question."
      render :edit
    end
  end

  def destroy
    @post = Post.find(params[:id])
    if @post.destroy
      flash[:notice] = "The question was deleted successfully."
      redirect_to posts_path
    else
      flash[:alert] = "There was a problem deleting the question."
      redirect_to post_path @post
    end
  end

  private
  def post_params
    params.require(:post).permit(:body, :title, :user_id)
  end
end
