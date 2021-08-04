class Variant < ApplicationRecord
  belongs_to :model
  has_one :year
  has_one :engine
  has_one :transmission
  has_one :fuel
  has_one :body_type
  has_one :drive
  has_many :listings

  validates :fuel_consumption, numericality: { greater_than: 0 }
  validates :safety_rating, numericality: { great_than: 0, less_than_or_equal_to: 5 }
end
