class Event < ApplicationRecord
  belongs_to :listings
  has_one :location
end
