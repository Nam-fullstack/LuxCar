class Purchase < ApplicationRecord
  belongs_to :listing
  belongs_to :user
  has_one :invoice

  validates :payment_intent, presence: true
end
