class AnotificationsController < ApplicationController

  def index
    @anotifications = Anotification.all
  end

  def create
    @anotification = Anotification.new(anotification_params)
    if @anotification.save
      redirect_to anotification_path(@anotification),
                  notice: 'Notice was successfully created.'
    else
      render :new, notice: 'You got the some problem'
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
