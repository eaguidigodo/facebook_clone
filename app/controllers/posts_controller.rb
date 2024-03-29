class PostsController < ApplicationController
  before_action :set_post, only: [:edit, :update, :destroy]
  def index
    @users_name_and_mail = {}
    @post = Post.new
    @posts = Post.all
    @users = User.all
    @users.each do |user|
      @users_name_and_mail[user["id"]] = [user["name"], user["email"]]
    end
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      redirect_to posts_index_path, notice: "Your post has succesfully been created!"
    else
      render :index
    end
  end

  def confirm
    @post = current_user.posts.build(post_params)
    render :index if @post.invalid?
  end

  def edit
    @posts = Post.all
  end

  def destroy
    @post.destroy
    redirect_to posts_index_path, notice: "Your post has been successfully deleted!"
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
    params.require(:post).permit(:content, :image, :image_cache)
  end

  def set_post
    @post = Post.find(params[:id])
  end
end
