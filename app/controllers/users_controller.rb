class UsersController < ApplicationController
  before_action :authenticate_user!
 
  def index
    redirect_to root_path
  end

  def show
    @user = User.find(current_user.id)
  end

end