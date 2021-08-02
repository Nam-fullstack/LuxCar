class Listing < ApplicationRecord
  belongs_to :user
  belongs_to :variant
  belongs_to :colour
  belongs_to :state
end
