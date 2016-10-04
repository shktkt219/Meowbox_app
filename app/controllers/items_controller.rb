class ItemsController < ApplicationController
  before_action :set_item, except: [:index, :new, :create]
  before_action :set_box, except: [:destroy]
  before_action :set_plan, except: [:show]

  def index
    if params[:box_id]
     @items = @box.items
    else
      @items = Item.all
    end
  end

  def new
    @item = Item.new
  end

  def create
    @item = @box.items.new(item_params)
    if @item.save
      flash[:notice] = 'Successfully created'
      redirect_to item_path(@item)
    else
      render 'new'
    end
  end

  def show
    if params[:box_id]
      @item = @box.items.find(params[:id])
    else
      @item = Item.find(params[:id])
    end
  end

  def edit
  end

  def update
    if @item.update_attributes(item_params)
      flash[:notice] = 'Successfully updated'
      redirect_to item_path(@item)
    else
      render 'edit'
    end
  end

  def destroy
  end

  private

   def set_item
     @item = Item.find(params[:id])
   end

   def set_box
     if params[:box_id]
       @box = Box.find(params[:box_id])
     elsif params[:item] && params[:item][:box_id]
       @box = Box.find(params[:item][:box_id])
     end
   end

   def set_plan
     if params[:plan_id]
       @plan = Plan.find(params[:plan_id])
     elsif @box
       @box.plan
     end
   end

   def item_params
     params.require(:item).permit(:item_name, :description, :size, :image, :url)
   end
end
