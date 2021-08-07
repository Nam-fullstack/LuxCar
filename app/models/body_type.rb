class BodyType < ApplicationRecord
  has_many :doors
  has_many :variants, through: :doors
end
