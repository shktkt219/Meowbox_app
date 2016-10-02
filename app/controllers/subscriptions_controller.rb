class SubscriptionsController < ApplicationController
  def new
    @plans = Plan.all
    @subscription = Subscription.new
  end

  def create
  end
end
