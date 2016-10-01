class UsersController < ApplicationController
  before_action :user_signed_in?

  def show
    @user = User.find(params[:id])
    @user.subscription_id = params[:id]
    @subscription = Subscription.find(params[:id])
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "Cancel subscription"
    redirect_to root_url
  end

end
