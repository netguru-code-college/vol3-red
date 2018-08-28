class DashboardController < ApplicationController
  layout 'dashboard'

  before_action :authenticate_user!

  def index
    @user = current_user
    if admin?(@user)
      @estates = Estate.all
    # if current_user = admin show Estate.all
    else
      @user.apartments
      # current_user != admin ahow @user.apartments
    end

  end


  private
  def admin?(user)
    true
  end
end
