class UsersController < ApplicationController
  before_action :user_signed_in?

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "Account deleted."
    redirect_to root_url
  end

  def history
    @shipped_boxes = current_user.plan.boxes.where(shipped: true) 
  end

end
