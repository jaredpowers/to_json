class Api::APIUsersController < ApplicationController
  respond_to :json

  def index
    respond_with @users = User.all
  end


  def show
    respond_with @user

  rescue ActiveRecord::RecordNotFound
    render json: { message: "Not Found", status: 404}, status: 404
  end


  def new
    respond_with @user = User.new
  end

  def create
    respond_with @user = User.new(username: params[:user][:username])
  end

  def edit
    respond_with @user
  end


  def update
    @user.update(user_params)

    respond_with @user

  rescue ActiveRecord::RecordNotFound
    render json: { message: "Not Found", status: 404}, status: 404
  end


  def destroy
    @user.destroy

    respond_with @user.destroy

  rescue ActiveRecord::RecordNotFound
    render json: { message: "Not Found", status: 404}, status: 404
  end

private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:username)
  end

end
