class Transmission < ApplicationRecord
  has_many :variant
  has_one :speed
end
