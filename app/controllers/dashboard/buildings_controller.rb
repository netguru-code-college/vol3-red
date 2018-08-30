class Dashboard::BuildingsController < ApplicationController
  layout 'dashboard'
  before_action :authenticate_user!

  def index
    @user = current_user
    @estate = Estate.find(params[:estate_id])
    @buildings = Building.all
    
  end

  def show
    find_estate
    find_building
    @user = User.find(params[:id])
    @users = User.all

  end

  def new
    find_estate
    @building = Building.new
  end

  def edit
  end

  def create
    @building = Building.new(building_params)
    if @building.save
      redirect_to dashboard_estate_building_apartments_path(estate: @estate, building_id: @building.id), notice: 'Building successfully created.'
    else
      render :new, notice: 'You got the some problem'
    end
  end

  def update
  end


  def destroy
  end

  private

  def find_estate
    @estate = Estate.find(params[:estate_id])
  end
  
  def find_building
    @building = Building.find(params[:id])
  end

  def building_params
    params.require(:building).permit(:street, :building_number, :city, :zip_code, :estate_id)
  end
end
