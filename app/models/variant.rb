class Variant < ApplicationRecord
  belongs_to :model
  belongs_to :year
  belongs_to :engine
  belongs_to :speed
  belongs_to :fuel
  belongs_to :door
  belongs_to :drive_type
end
