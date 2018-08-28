class EnotificationsController < ApplicationController


  def index
    @enotifications = Enotification.all
  end
end
