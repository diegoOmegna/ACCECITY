class AddParkingAndRestroomRatingsToReview < ActiveRecord::Migration[7.0]
  def change
    add_column :reviews, :parking_rating, :integer
    add_column :reviews, :restroom_rating, :integer
    add_column :reviews, :other_rating, :integer
  end
end
