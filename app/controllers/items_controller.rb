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
    @item = Item.new
    @item.box_items.build
  end

  def create
    @item = Item.new
    if @box.items.count >= 3
      flash[:error] = "The Box has already had three items"
      render 'new'
    elsif @item = @box.items.new(item_params)
      @item.save
      @item.box_items.create(box_id: @box.id)
      flash[:notice] = 'Successfully created'
      redirect_to box_path(@box)
    else
      render 'new'
    end
  end

  def show
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
     elsif params[:item] && params[:item][:boxes][:box_id]
       @box = Box.find(params[:item][:boxes][:box_id])
     end
   end

   def set_plan
     if params[:plan]
       @plan = Plan.find(params[:plan_id])
     elsif @box
       @plan = @box.plan
     end
   end

   def item_params
     params.require(:item).permit(:item_name, :description, :size, :image, :url)
   end
end
