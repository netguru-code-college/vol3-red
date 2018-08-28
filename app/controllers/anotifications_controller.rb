class AnotificationsController < ApplicationController

  def index
    @anotifications = Anotification.all
  end

end
