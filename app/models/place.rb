class Place < ApplicationRecord
  belongs_to :user
  has_many_attached :photo
  has_many :reviews

  include PgSearch::Model

  pg_search_scope :search_by_name_and_details,
    against: [ :name, :details, :address ],
    using: {
      tsearch: { prefix: true }
    }
end
