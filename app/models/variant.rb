class Variant < ApplicationRecord
  belongs_to :year
  belongs_to :engine
  belongs_to :transmission
  belongs_to :fuel
  belongs_to :body_type
  belongs_to :drive
end
