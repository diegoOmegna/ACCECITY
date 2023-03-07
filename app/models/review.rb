class Review < ApplicationRecord
  belongs_to :user
  belongs_to :place

  validates :rating, presence: true
  validates :comment, presence: true, length: { maximum: 400 }
end
