class Transmission < ApplicationRecord
  has_many :variants
  has_many :speeds
end
