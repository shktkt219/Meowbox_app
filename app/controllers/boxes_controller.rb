class BoxesController < ApplicationController
  before_action :set_plan
  before_action :set_box, except: [:index, :new, :create, :ship]
  before_action :admin_only, except: [:index, :show]


  def index
    if @plan
      @boxes = @plan.boxes
      render 'boxes/index', :layout => false
    else
      @boxes = Box.all
    end
  end

  def show
    @items = @box.items
  end

  def new
    @box = Box.new
    3.times {@box.items.build}
  end

  def create
    @box = @plan.boxes.new(box_params)
    if @box.save
      flash[:success] = "Successfully created."
      redirect_to plan_boxes_path(@plan)
    else
      render 'new'
    end
  end

  def edit
    @box_count = @box.items.count
    if @box_count == 2
      @box.items.build
    elsif @box_count == 1
      2.times {@box.items.build}
    end
  end

  def update
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

  def ship
    @box = Box.find(params[:box_id])
    @box.update(shipped: true, shipped_date: Time.now)
    flash[:notice] = 'Successfully shipped'
    redirect_to @box
  end

  private

    def box_params
      params.require(:box).permit(:title, :month_year, :plan_id, :item_ids => [], :items_attributes => [:id, :item_name, :description, :size, :url, :image, :_destroy])
    end

    def set_plan
      if params[:plan_id]
        @plan = Plan.find(params[:plan_id])
      elsif params[:box] && params[:box][:plan_id]
        @plan = Plan.find(params[:box][:plan_id])
      end
    end

    def set_box
      @box = Box.find(params[:id])
    end

end
