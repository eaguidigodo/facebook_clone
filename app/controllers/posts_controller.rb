class PostsController < ApplicationController
  def index
    @post = Post.new
    @posts = Post.all
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      redirect_to posts_index_path, notice: "Your post has succesfully been created!"
    else
      render :index
    end
  end

  def Confirm
    @post = current_user.posts.build(post_params)
  end

  private
  def post_params
    params.require(:post).permit(:content)
  end
end
