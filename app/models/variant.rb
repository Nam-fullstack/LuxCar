class Variant < ApplicationRecord
  has_one :year
  has_one :engine
  has_one :transmission
  has_one :fuel
  has_one :body_type
  has_one :drive
  has_many :listings
end
