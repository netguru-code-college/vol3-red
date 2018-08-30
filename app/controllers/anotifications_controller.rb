class AnotificationsController < ApplicationController
  layout 'dashboard'
  def index
    @anotifications = Anotification.all
  end

  def create
    @anotification = Anotification.new(anotification_params)
    if @anotification.save
      redirect_to dashboard_estate_building_apartment_path(
          :id => @anotification.apartment_id,
          :building_id => @anotification.apartment.building_id, 
          :estate_id => @anotification.apartment.building.estate_id
        ),
                  notice: 'Notice was successfully created.'
    else
      redirect_to dashboard_estate_building_apartment_path(
          :id => @anotification.apartment_id,
          :building_id => @anotification.apartment.building_id, 
          :estate_id => @anotification.apartment.building.estate_id
        ),
                  notice: 'Hello! it is meeeee! Your error!'
    end
  end

  def new
    @anotification = Anotification.new
  end

  def show
    @anotification = Anotification.find(params[:id])
  end

  private
  def anotification_params
    params.require(:anotification).permit(:apartment_id, :title, :body, :valid_up_to_date)
  end
end
