class Purchase < ApplicationRecord
  belongs_to :listing
  belongs_to :user
  has_one :invoice
end
