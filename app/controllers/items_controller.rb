class ItemsController < ApplicationController
  before_action :set_item, except: [:index, :new, :create]
  before_action :set_box, except: [:index, :destroy]
  before_action :set_plan, except: [:index, :show]

  def index
    @items = Item.all
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
  end

  def edit
  end

  def update
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
