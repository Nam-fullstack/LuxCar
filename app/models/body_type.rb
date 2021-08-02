class BodyType < ApplicationRecord
  has_one :door
  has_many :variants
end
