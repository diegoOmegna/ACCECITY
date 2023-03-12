class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    @places = Place.top.first(5)

    @places.each do |place|
      @reviews = Review.where(place_id: place.id).order("created_at DESC")
      if @reviews.blank?
        @avg_review = 0
      else
        @avg_review = @reviews.average(:rating).round(2)
      end
    end

    # @places = Place.search_by_name_and_details(params[:query])
    # @user = current_user
  end
end
