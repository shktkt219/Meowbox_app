class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :admin_only, only: [:index]

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
    @user = User.find(params[:user_id])
    @history_boxes = @user.boxes.where("shipped_date > ?", @user.subscription.created_at)
  end

end
