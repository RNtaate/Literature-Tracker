class UsersController < ApplicationController
  before_action :authenticate_user!
 
  def index
    redirect_to root_path
  end

  def show
    @user = User.find(current_user.id)
  end

  def community
    @users = User.all.with_attached_image.all
  end

  def reader
    @user = User.find(params[:id])
  end
end