class AnotificationController < ApplicationController

  def create
    @anotification = current_estate.anotifications.build
      if @anotification.save flash[:success] = "Apartment notification created!"
      redirect_to request.referrer
      end
  end

  def destroy
    @anotification.destroy
    flash[:success] = "Apartment notificaion deleted!"
    redirect_to request.referrer
  end
end
