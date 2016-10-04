class BoxesController < ApplicationController
  before_action :set_plan
  before_action :set_box, except: [:index, :new, :create]

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
  end

  def create
    @box = @plan.boxes.new(box_params)
    item_size_valid?
    if @box.save
      flash[:success] = "Successfully created."
      redirect_to plan_boxes_path(@plan)
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    item_size_valid?
    if @box.update_attributes(box_params)
      flash[:notice] = "Successfully updated."
      redirect_to plan_box_path(@plan, @box)
    else
      render 'edit'
    end
  end

  def destroy
    @box.destroy
    flash[:notice] = "Successfully destroyed."
    redirect_to boxes_path
  end

  private

    def box_params
      params.require(:box).permit(:title, :month_year, :plan_id, :item_ids => [], :items_attributes => [:item_name] && [:description] && [:size] && [:url] && [:image])
    end

    def set_plan
      if params[:plan_id].present?
        @plan = Plan.find(params[:plan_id])
      elsif params[:box].present? && params[:box][:plan_id].present?
        @plan = Plan.find(params[:box][:plan_id])
      end
    end

    def set_box
      @box = Box.find(params[:id])
    end

end
