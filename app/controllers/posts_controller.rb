class PostsController < ApplicationController

  def index
    @post = Post.all
  end

  def show
    @post = Post.set_posts
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new
    @post.body = params[:post][:body]
    @post.title = params[:post][:title]
    @post.save
  end

  def edit
    @post = set_posts
  end

  def update
    @post = Post.find(params[:id], post_params)
  end

  def destroy
    @post = set_posts
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
