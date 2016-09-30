class UsersController < ApplicationController
  before_action :user_signed_in?

  def show
    @user = User.find(params[:id])
    # @boxes = @user.boxes(params[:user_id])
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "Cancel subscription"
    redirect_to root_url
  end

end
