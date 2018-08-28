class EnotificationController < ApplicationController

  def create
    @enotification = current_estate.enotifications.build
      if @enotification.save flash[:success] = "Estate notification created!"
      redirect_to request.referrer
      end
  end

  def destroy
    @enotification.destroy
    flash[:success] = "Estate notificaion deleted!"
    redirect_to request.referrer
  end
end
