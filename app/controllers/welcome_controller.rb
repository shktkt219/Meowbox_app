class WelcomeController < ApplicationController

  def home
    @sub_1 = Subscription.find(1)
    @sub_2 = Subscription.find(2)
    @sub_3 = Subscription.find(3)
  end
end
