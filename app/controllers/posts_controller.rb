class PostsController < ApplicationController
  def index
    @post = Post.new
  end

  def create
    raise
    @post = Post.new(post_params)
    if @post.save
      redirect_to posts_index_path, notice: "Your post has succesfully been created!"
    else
      render :index
    end
  end

  private
  def post_params
    params.require(:post).permit(:content)
  end
end
