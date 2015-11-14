# Post Controller
class PostsController < ApplicationController

  before_action :find_post, only: [:show, :edit, :update, :destroy]

  def index
    @posts = Post.all
  end

  def show
   
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      flash[:notice] = 'Post successfully created'
      redirect_to '/posts'
    else
      flash[:alert] = 'Unable to add post'
      render 'new'
    end
  end

  def edit
  end

  def update
    if @post.update post_params
      flash[:notice] = 'The post has been successfully updated'
      redirect_to @post
    else
      flash[:alert] = 'Unable to update post'
      render 'edit'
    end
  end

  def destroy
    @post.destroy
    flash[:notice] = 'Post successfully deleted!'
    redirect_to '/posts'
  end

  private

  def find_post
    @post = Post.friendly.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :content, :slug)
  end
end
