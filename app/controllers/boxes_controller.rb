class BoxesController < ApplicationController
  before_action :user_signed_in?, only: [:index, :new, :create, :show]

  def index
    @plan = Plan.find(params[:plan_id])
    @boxes = @plan.boxes
  end

  def show
    @box = Box.find(params[:id])
    @items = @box.items
  end

  def new
    @plan = Plan.find(params[:plan_id])
    @box = Box.new
    @items = @box.items.build
  end

  def create
    @box = Box.new(box_params)
    if @box.save
      flash[:success] = "Box was successfully created."
      redirect_to @box
    else
      render 'boxes/new'
    end
  end

  private

    def box_params
      params.require(:box).permit(:title, :month_year, :plan_id, :items_ids => [], :items_attributes => [:title])
    end

end
