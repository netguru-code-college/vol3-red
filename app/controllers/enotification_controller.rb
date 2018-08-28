class EnotificationController < ApplicationController
  #before_action :authenticate_user!, scope: :admin

  def create
    @enotification = current_estate.enotifications.build
      if @enotification.save flash[:success] = "Notification created!"
      redirect_to request.referrer
      end
  end

  def destroy
    @enotification.destroy
    flash[:success] = "Notificaion deleted!"
    redirect_to request.referrer
  end
end
