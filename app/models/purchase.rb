class Purchase < ApplicationRecord
  belongs_to :invoice
  belongs_to :listing
end
