class ReviewsController < ApplicationController
  before_action :set_review, only: [:show, :edit, :update, :destroy]
  before_action :set_place
  before_action :authenticate_user!

  def index
    @reviews = Review.all
  end



  def edit
    if @review.user_id == current_user.id
      render :edit
    else
      redirect_to place_path(@place)
    end
  end

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @review.user_id = current_user.id
    @review.place_id = @place.id

    if @review.save
      redirect_to @place
    else
      render :new
    end
  end

  def update
    @review.update(review_params)
  end

  def destroy
    @review.destroy
  end

  private

  def set_review
    @review = Review.find(params[:id])
  end

  def set_place
    @place = Place.find(params[:place_id])
  end

  def review_params
    params.require(:review).permit(:rating, :restroom_rating, :parking_rating, :other_rating, :comment)
  end
end
