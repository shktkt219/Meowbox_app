class UsersController < ApplicationController
  before_action :user_signed_in?

  def show
    @user = User.find(params[:id])
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "Account deleted."
    redirect_to root_url
  end

end
