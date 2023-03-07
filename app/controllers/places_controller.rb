class PlacesController < ApplicationController
  before_action :set_place, only: [:show, :edit, :update]


  def index
    @places = Place.all
  end

  def show
  end

  def new
    @place = Place.new
  end

  def create
    @place = Place.new(place_params)
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

  private

  def place_params
    params.require(:place).permit(:name, :address, :details, :user_id)
  end

  def set_place
    @place = Place.find(params[:id])
  end

end
