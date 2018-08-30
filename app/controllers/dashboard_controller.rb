class DashboardController < ApplicationController
  layout 'dashboard'

  before_action :authenticate_user!

  def index
    @user = current_user
    @estates = Estate.all

    @anotifications = []
    @bnotifications = []
    @enotifications = []

    @user.apartment_users.each do |apartment_user|
      apartment = apartment_user.apartment
      @anotifications << apartment.anotifications
      @bnotifications << apartment.building.bnotifications
      @enotifications << apartment.building.estate.enotifications
    end
    
    @anotifications.flatten!
    @bnotifications.flatten!
    @enotifications.flatten!
  end
end
