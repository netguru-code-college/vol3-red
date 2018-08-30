# coding: utf-8
class Dashboard::ApartmentsController < ApplicationController
  layout 'dashboard'
  before_action :authenticate_user!
  before_action :find_estate, only: [:index, :show, :edit, :update, :destroy]

  def index
    @user = current_user
    @estates = Estate.all
    @buildings = Building.all
    @building = Building.find(params[:building_id])
    @apartments = @building.apartments
    @bnotifications = @building.bnotifications 


  end

  def show
    @estates = Estate.all
    @apartment = Apartment.find(params[:id])
    @anotifications = @apartment.anotifications
  end

  def new
    @estate = Estate.new(estate_params)
  end

  def edit
  end

  def create
    @estate = Estate.find(params[:id])
    if @estate.safe
      redirect_to @estate, notice: 'Estate was successfully created.'
    else
      render :new
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

  def estate_params
    params.require(:estate).permit(:name)
  end
end
