class ItemsController < ApplicationController
  before_action :set_item, except: [:index, :new, :create]
  before_action :set_box, except: [:destroy]
  before_action :set_plan, except: [:index]
  before_action :admin_only, except: [:index, :show]

  def index
    if params[:box_id]
     @items = @box.items
    else
      @items = Item.all
    end
  end

  def new
    if params[:box_id]
      @item = @box.items.new
    else
      @item = Item.new
    end
  end

  def create
    if params[:box_id]
      @item = @box.items.new(item_params)
    else
      @item = Item.new(item_params)
    end
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
      if params[:box_id]
        redirect_to box_items_path(@box)
      else
        redirect_to item_path(@item)
      end
    else
      render 'edit'
    end
  end

  def destroy
    @item.destroy
    flash[:notice] = "Successfully deleted"
    redirect_to items_path
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
     if params[:plan]
       @plan = Plan.find(params[:plan_id])
     elsif @box
       @plan = @box
     end
   end

   def item_params
     params.require(:item).permit(:item_name, :description, :size, :image, :url)
   end
end
