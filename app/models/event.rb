class Event < ApplicationRecord
  belongs_to :listing
  belongs_to :location
end
