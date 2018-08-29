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
    @user = User.find(params[:id])
    @users = User.all

  end

  def new
    @building = Building.new
  end

  def edit
  end

  def create
    @building = Estate.new(estate_params)
    if @building.save
      redirect_to root_path, notice: 'Estate was successfully created.'
    else
      render :new, notice: 'You got the some problem'
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
