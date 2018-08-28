class BnotificationController < ApplicationController
  def create
    @bnotification = current_estate.bnotifications.build
      if @bnotification.save flash[:success] = "Building notification created!"
      redirect_to request.referrer
      end
  end

  def destroy
    @bnotification.destroy
    flash[:success] = "Building notificaion deleted!"
    redirect_to request.referrer
  end
end
