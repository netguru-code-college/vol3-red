class DashboardController < ApplicationController
  layout 'dashboard'

  before_action :authenticate_user!

  def index
    current_user = current_user
    @user = current_user
    @estates = Estate.all
  end
end
