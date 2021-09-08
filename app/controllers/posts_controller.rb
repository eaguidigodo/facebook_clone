class PostsController < ApplicationController
  before_action :set_post, only: [:edit, :update]
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

  def edit
    @posts = Post.all
  end

  def update
    if @post.update(post_params)
      redirect_to posts_index_path, notice: "Your post has been succesfully updated!"
    else
      render :edit
    end
  end

  private
  def post_params
    params.require(:post).permit(:content)
  end

  def set_post
    @post = Post.find(params[:id])
  end
end
