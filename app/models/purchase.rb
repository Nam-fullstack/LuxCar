class Purchase < ApplicationRecord
  has_one :invoice
  belongs_to :listing
end
