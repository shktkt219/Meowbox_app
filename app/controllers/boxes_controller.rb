class BoxesController < ApplicationController
  before_action :user_signed_in?, only: [:index, :new, :create]

  def index
    @boxes = Box.all
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
      params.require(:box).permit(:title, :level, :year, :month, :items_ids => [], :items_attributes => [:title])
    end

end
