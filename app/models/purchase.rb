class Purchase < ApplicationRecord
  has_one :invoice
  belongs_to :listing
  belongs_to :user
end
