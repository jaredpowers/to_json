class Api::PostsController < ApplicationController
  respond_to :json

  def index
    respond_with @posts = Post.all
  end


  def show
    @post = set_posts
    respond_with @post

  rescue ActiveRecord::RecordNotFound
    render json: { message: "Not Found", status: 404}, status: 404
  end

  def new
    respond_with @post = Post.new
  end

  def create
    respond_with @post = Post.new(post: params[:post][:body])
  end

  def edit
    respond_with @post
  end


  def update
    @post.update(post_params)

    respond_with @post

  rescue ActiveRecord::RecordNotFound
    render json: { message: "Not Found", status: 404}, status: 404
  end


  def destroy
    @post.destroy

    respond_with @post.destroy

  rescue ActiveRecord::RecordNotFound
    render json: { message: "Not Found", status: 404}, status: 404
  end

private

  def set_posts
    Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :body)
  end



end
