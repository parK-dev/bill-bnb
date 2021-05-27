class Location < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy

  has_one_attached :photo

  validates :name, presence: true
  validates :address, presence: true
  validates :price_per_day, presence: true
  validates :description, presence: true
  validates :capacity, presence: true
  validates :description, length: { minimum: 12 }
  validates :description, length: { maximum: 48 }

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  def unavailable_dates
    bookings.confirmed.pluck(:start_date, :end_date).map do |range|
      { from: range[0], to: range[1] }
    end
  end

end
