class PlacesController < ApplicationController
  def index
    @places = Place.all()
  end

  def show
    @places = Place.find(params[:id])
  end

  def edit
    @places = Place.find(params[:id])
  end

  def new
    @places = Place.new
  end

  def create
   place = Place.create(place_params)

   redirect_to_places_path
  end

  private

  def place_params
    params.require(:place).permit(:name, :address)
  end

end
