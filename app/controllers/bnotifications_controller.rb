class BnotificationsController < ApplicationController
  layout 'dashboard'
  def index
    @bnotifications = Bnotification.all
  end

  def create
    @bnotification = Bnotification.new(bnotification_params)
    if @bnotification.save
      redirect_to dashboard_estate_building_apartments_path(:building_id => @bnotification.building_id, :estate_id => @bnotification.building.estate_id),
                  notice: 'Notice was successfully created.'
    else
      redirect_to dashboard_estate_building_apartments_path(:building_id => @bnotification.building_id, :estate_id => @bnotification.building.estate_id),
                  notice: 'Hello! it is meeeee! Your error!'
    end
  end

  def new
    @bnotification = Bnotification.new
  end

  def show
    @bnotification = bnotification.find(params[:id])
  end

  private
  def bnotification_params
    params.require(:bnotification).permit(:building_id, :title, :body, :valid_up_to_date)
  end
end
