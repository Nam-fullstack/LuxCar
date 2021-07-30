class Variant < ApplicationRecord
  belongs_to :model
  has_one :engine
  has_one :transmission
  has_one :fuel
  has_one :body_type
end
