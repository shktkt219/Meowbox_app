class WelcomeController < ApplicationController

  def home
    @plan_1 = Plan.find(1)
    @plan_2 = Plan.find(2)
    @plan_3 = Plan.find(3)
  end
end
