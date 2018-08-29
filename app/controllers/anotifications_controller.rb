class AnotificationsController < ApplicationController

  def index
    @anotifications = Anotification.all
  end

  def create
    @anotification = Anotification.new(anotification_params)
    if @anotification.save
      redirect_to anotifications_path,
                  notice: 'Notice was successfully created.'
    else
      redirect_to anotifications_path,
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
    params.require(:anotification).permit(:buildings, :apartment_id, :title, :body, :valid_up_to_date)
  end
end
