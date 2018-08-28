class Dashboard::EstatesController < ApplicationController
  layout 'dashboard'
  before_action :authenticate_user!
  before_action :find_estate, only: [:show, :edit, :update, :destroy]

  def index
    @estates = Estate.all
    @user = current_user
  end

  def show
  end

  def new
    @estate = Estate.new(estate_params)
  end

  def edit
  end

  def create
    @estate = Estate.find(params[:id])
    if @estate.safe
      redirect_to @estate, notice: 'Estate was successfully created.'
    else
      render :new
    end
  end

  def update
  end


  def destroy
  end

  private
  def find_estate
    @estate = Estate.find(params[:id])
  end

  def estate_params
    params.require(:estate).permit(:name)
  end


end
