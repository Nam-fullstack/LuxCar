class Purchase < ApplicationRecord
  belongs_to :user
  belongs_to :listing
  belongs_to :invoice
end
