class Transmission < ApplicationRecord
  has_many :speeds
  has_many :variants, through: :speeds
end
