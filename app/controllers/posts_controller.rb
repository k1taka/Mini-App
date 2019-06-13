class PostsController < ApplicationController

  before_action :move_to_index,except: :index

  def index
    @posts = Post.all.order("id DESC").page(params[:page]).per(5)
  end

  def new
    @post=Post.new
  end

  def create
    Post.create(post_params)

    # redirect_to root_path
  end

  def destroy
    post = Post.find(params[:id])
    post.destroy if post.user_id == current_user.id
    # redirect_to root_path
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    post = Post.find(params[:id])
    post.update(post_params) if post.user_id == current_user.id
    redirect_to root_path
  end

  private
  def post_params
    params.require(:post).permit(:name, :image, :text).merge(user_id: current_user.id)
  end

  def move_to_index
    redirect_to action: :index  unless user_signed_in?
  end

end
