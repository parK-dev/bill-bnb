class Location < ApplicationRecord
  belongs_to :user
  has_many :bookings

  has_one_attached :photo
  validates :name, :address, :price_per_day, :description, :capacity, presence: true

end
