class Place < ApplicationRecord
  belongs_to :user
  has_many_attached :photo
  has_many :reviews

end
