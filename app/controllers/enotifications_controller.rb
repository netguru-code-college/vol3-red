class EnotificationsController < ApplicationController
  layout 'dashboard'
  def index
    @enotifications = Enotification.all
  end

  def create
    @enotification = Enotification.new(enotification_params)
    if @enotification.save
      redirect_to dashboard_estate_path(:id => @enotification.estate_id),
                  notice: 'Notice was successfully created.'
    else
      redirect_to dashboard_estate_path(:id => @enotification.estate_id),
                  notice: 'Hello! it is meeeee! Your error!'
    end
  end

  def new
    @enotification = Enotification.new
  end

  def show
    @enotification = enotification.find(params[:id])
  end

  private

  def enotification_params
    params.require(:enotification).permit(:estate_id, :title, :body, :valid_up_to_date)
  end
end
