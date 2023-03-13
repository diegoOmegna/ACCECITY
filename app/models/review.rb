class Review < ApplicationRecord
  belongs_to :user
  belongs_to :place

  validates :rating, presence: true
  validates :restroom_rating, presence: true
  validates :parking_rating, presence: true
  validates :other_rating, presence: true
  validates :comment, presence: true, length: { maximum: 400 }
  delegate :first_name, to: :user, prefix: true
end
