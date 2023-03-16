class PlacesController < ApplicationController
  before_action :authenticate_user!, :except => [:index, :show]
  before_action :set_place, only: [:show, :edit, :update, :destroy]

  def index
    if params[:query].present?
      @places = Place.search_by_name_and_details(params[:query])
    else
      @places = Place.all
    end

    # @markers = @places.geocoded.map do |place|
    #   {
    #     lat: place.latitude,
    #     lng: place.longitude,
    #     info_window_html: render_to_string(partial: "info_window", locals: { place: place})
    #     marker_html: render_to_string(partial: "marker", locals: { place: place})
    #   }
    # end
  end

  def show
    @reviews = Review.where(place_id: @place.id).order("created_at DESC")
    if @reviews.blank?
      @avg_review = 0
    else
      @avg_review = @reviews.average(:rating).round(2)
    end

    @markers = [
      {
        lat: @place.latitude,
        lng: @place.longitude,
        info_window_html: render_to_string(partial: "info_window", locals: { place: @place }),
        marker_html: render_to_string(partial: "marker", locals: { place: @place })
      }
    ]
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
      render :new, status: :unprocessable_entity # it didn t work properly to create a new place
    end
  end

  def edit
  end

  def update

    if @place.update(place_params)
      redirect_to place_path(@place)
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
    params.require(:place).permit(:name, :details, :address, :header_photo, photos:[])
  end

  def set_place
    @place = Place.find(params[:id])
  end
end
