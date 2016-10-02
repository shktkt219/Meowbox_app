class SubscriptionsController < ApplicationController
  def new
    @plans = Plan.all
    @subscription = Subscription.new
  end

  def create
    @plan = Plan.find_by(id: params[:subscription][:plan_id])
    @user = User.find(params[:user_id])
    if @user.subscription == nil
      @subscription = Subscription.create(user_id: @user.id, plan_id: @plan.id)
      if @subscription.save
        flash[:notice] = "Successfully subscribed!"
        redirect_to user_path(current_user)
      else
        flash[:alart] = "Try again"
        render 'subscriptions/new'
      end
    else
      flash[:alart] = "You've already subscribed to #{current_user.plan.name}".
      redirect_to user_path(current_user)
    end
  end
end
