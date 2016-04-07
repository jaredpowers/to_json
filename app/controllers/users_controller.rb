class UsersController < ApplicationController

  def index
    @user.User.new
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new
    @user.save
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    User.update(params[:id])
  end

  def destroy
    @user = User.find(params[:id])
  end

private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:username)
  end

end
