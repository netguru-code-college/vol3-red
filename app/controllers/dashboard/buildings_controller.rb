class Dashboard::BuildingsController < ApplicationController
  layout 'dashboard'
  before_action :authenticate_user!

  def index
    @user = current_user
    @estate = Estate.find(params[:id])
    @buildings = Building.all
  end

  def show
    @estate = Estate.find(params[:id])    
    @building = Building.find(params[:id])
  end

  def new
    @building = building.new(building_params)
  end

  def edit
  end

  def create
    @building = building.find(params[:id])
    if @building.safe
      redirect_to @building, notice: 'building was successfully created.'
    else
      render :new
    end
  end

  def update
  end


  def destroy
  end

  private
  def find_building
    @building = building.find(params[:id])
  end


end
