class BnotificationsController < ApplicationController

  def index
    @bnotifications = Bnotification.all
  end

end
