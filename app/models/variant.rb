class Variant < ApplicationRecord
  belongs_to :model
  has_many :engines
  has_one :transmission
  has_many :fuel
  has_one :body_type
end
