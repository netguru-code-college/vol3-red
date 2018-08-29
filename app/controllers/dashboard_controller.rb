class DashboardController < ApplicationController
  layout 'dashboard'

  before_action :authenticate_user!

  def index
    @user = current_user
    @estates = Estate.all
    @apartments = @user.apartments
    @enotifications = Enotification.all
    @bnotifications = Bnotification.all
    @anotifications = Anotification.all
  end
end
