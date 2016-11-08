class PlansController < ApplicationController
  before_action :admin_only, except: [:index, :show]

  def index
    @plans = Plan.all
  end

  def show
    @plan = Plan.find(params[:id])
    @boxes = @plan.boxes
    respond_to do |format|
      format.html { render :show }
      format.json { render json: @plan }
    end
  end

  def new
    @plan = Plan.new
  end

  def create
    @plan = Plan.new(plan_params)
    if @plan.save
      flash[:notice] = "Successfully created"
      render json: @plan, status: 201
    else
      render json: @plan, status: 400
    end
  end

  private

  def plan_params
    params.require(:plan).permit(:name, :price, :description)
  end


end
