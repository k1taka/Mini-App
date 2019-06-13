class PostsController < ApplicationController

  def index
    @posts = Post.all.order("id DESC").page(params[:page]).per(5)
  end

  def new
    @post=Post.new
  end

  def create
    Post.create(post_params)
    redirect_to root_path
  end


  private
  def post_params
    params.require(:post).permit(:name, :image, :text)
  end

end
