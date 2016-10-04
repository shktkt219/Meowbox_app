class ItemsController < ApplicationController
  before_action :set_item, except: [:index, :new, :create]

  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    
  end

  def show

  end

  private

   def set_item
     @item = Item.find(params[:id])
   end
end
