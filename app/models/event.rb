class Event < ApplicationRecord
  belongs_to :listing
  has_one :location
end
