class Invoice < ApplicationRecord
  belongs_to :purchase
  has_one :buyer, :through => :purchases
  has_one :seller, :through => :purchases
end
