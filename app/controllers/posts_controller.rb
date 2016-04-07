class PostsController < ApplicationController

  def index
    @post = Post.new
  end

  def show
    post = Post.find(params[:id])
    if post
      @post = postend
    end
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new
    @post.body = params[:post][:body]
    @post.save
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
  end

private

  def set_posts
    Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :body)
  end

end
