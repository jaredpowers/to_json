class Api::PostsController < ApplicationController
  respond_to :json

  def index
    respond_with @posts = Post.all
  end


  def show
    respond_with @post
  end


  def new
    respond_with @post = Post.new
  end

  def create
    respond_with @post = Post.new(postname: params[:post][:postname])
  end

  def edit
    respond_with @post
  end


  def update
    @post.update(post_params)

    respond_with @post
  end


  def destroy
    @post.destroy

    respond_with @post.destroy
  end

private

  def set_posts
    Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :body)
  end

end
