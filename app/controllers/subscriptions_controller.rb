class SubscriptionsController < ApplicationController

  def index
    @subscriptions = Subscription.all
  end

  def show
    @subscription = Subscription.find(params[:id])
    @boxes = @subscription.boxes
  end
end
