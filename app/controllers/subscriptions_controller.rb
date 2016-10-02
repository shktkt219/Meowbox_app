class SubscriptionsController < ApplicationController
  def new
    @plans = Plan.all
    @subscription = Subscription.new
  end

  def create
    @plan = Plan.find_by(id: params[:subscription][:plan_id])
    @user = User.find(params[:user_id])
    if @user.subscription != nil
      flash[:notice] = "You've already subscribed to #{current_user.plan.name} plan"
    else
      @subscription = Subscription.create(user_id: @user.id, plan_id: @plan.id)
      flash[:notice] = "Successfully subscribed!"
    end
    redirect_to user_path(current_user)
  end

end
