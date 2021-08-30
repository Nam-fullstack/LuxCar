class Year < ApplicationRecord
  has_many :variants
  has_many :listings, through: :variant
end
