class Door < ApplicationRecord
  belongs_to :body_type
  has_many :variants
end
