class PlacesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_place, only: [:show, :edit, :update, :destroy]

  def index
    if params[:query].present?
      @places = Place.search_by_name_and_details(params[:query])
    else
      @places = Place.all
    end
  end

  def show
  end

  def new
    @place = Place.new
  end

  def create
    @place = Place.new(place_params)
    @place.user = current_user
    if @place.save
      redirect_to places_path
    else
      render :new, status: :unprocessable_entity #it didn t work properly to create a new place
    end
  end

  def edit
  end

  def update
    if @place.update(place_params)
      redirect_to places_path
    else
      render :edit
    end
  end

  def destroy
    if @place.destroy
      redirect_to places_path
    else
      render :index
    end
  end

  private

  def place_params
    params.require(:place).permit(:name, :address, :details)
  end

  def set_place
    @place = Place.find(params[:id])
  end

end
