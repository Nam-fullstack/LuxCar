class Transmission < ApplicationRecord
  has_many :variants, through: :speeds
  has_many :speeds
end
