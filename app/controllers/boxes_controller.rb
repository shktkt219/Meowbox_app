class BoxesController < ApplicationController
  before_action :user_signed_in?, only: [:index, :new, :create, :show]
  before_action :find_plan

  def index
    if @plan
      @boxes = @plan.boxes
    else
      @boxes = Box.all
    end
  end

  def show
    @box = Box.find(params[:id])
    @items = @box.items
  end

  def new
    @box = Box.new
    @items = @box.items.build
  end

  def create
    @box = @plan.boxes.new(box_params)
    if @box.save
      flash[:success] = "Box was successfully created."
      redirect_to plan_boxes_path(@plan)
    else
      render 'new'
    end
  end

  private

    def box_params
      params.require(:box).permit(:title, :month_year, :plan_id, :item_ids => [], :items_attributes => [:item_name] && [:description] && [:size] && [:url] && [:image])
    end

    def find_plan
      if params[:plan_id] != nil
        @plan = Plan.find(params[:plan_id])
      elsif params[:box] != nil && params[:box][:plan_id] != nil
        @plan = Plan.find(params[:box][:plan_id])
      end
    end

end
