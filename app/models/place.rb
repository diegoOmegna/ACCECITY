class Place < ApplicationRecord
  belongs_to :user
  has_many_attached :photos
  has_one_attached :header_photo
  has_many :reviews
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  include PgSearch::Model

  pg_search_scope :search_by_name_and_details,
    against: [ :name, :details, :address ],
    using: {
      tsearch: { prefix: true }
    }
  scope :top, -> { joins(:reviews).order(rating: :desc) }
end
