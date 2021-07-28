class Listing < ApplicationRecord
  belongs_to :user
  belongs_to :make
  belongs_to :model
end
