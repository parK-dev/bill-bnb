class Location < ApplicationRecord
  belongs_to :user
  has_many :bookings

  has_one_attached :photo

  validates :name, presence: true
  validates :address, presence: true
  validates :price_per_day, presence: true
  validates :description, presence: true
  validates :capacity, presence: true
  validates :description, length: { minimum: 12 }
  validates :description, length: { maximum: 48 }



end
