class Dashboard::EstatesController < ApplicationController
  layout 'dashboard'

  before_action :authenticate_user!

  def index
    @user = current_user
    @estates = Estate.all
  end

  def edit
  end

  def show
    @estate = Estate.find(params[:id])
  end


  def create
    @estate = Estate.find(params[:id])
  end

  private


end
