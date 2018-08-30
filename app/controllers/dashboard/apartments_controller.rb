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
    find_estate
    find_building
    @apartment = Apartment.new
  end

  def edit
  end

  def create
    @apartment = Apartment.new(apartment_params)
    if @apartment.save
      redirect_to dashboard_path, notice: 'Apartment was successfully created.'
    else
      render :new, notice: "You did it wrong!"
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
    @building = Building.find(params[:building_id])
  end

  def apartment_params
    params.require(:apartment).permit(:building_id, :apartment_number)
  end
end
