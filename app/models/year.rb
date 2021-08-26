class Year < ApplicationRecord
  has_many :variants
  has_one :listings, through: :variant
end
