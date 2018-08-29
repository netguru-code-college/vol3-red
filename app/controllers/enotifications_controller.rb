class EnotificationsController < ApplicationController
  layout 'dashboard'
  def index
    @enotifications = Enotification.all
  end

  def create
    @enotification = Enotification.new(enotification_params)
    if @enotification.save
      redirect_to enotifications_path,
                  notice: 'Notice was successfully created.'
    else
      redirect_to enotifications_path,
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
