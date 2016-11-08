class CarsController < ApplicationController
  def create
  end

  def index
    @cars = Car.all
    respond_to do |f|
     f.html { render 'index'}
     f.json { render json: @cars }
    end
  end

  def show
  end
end
