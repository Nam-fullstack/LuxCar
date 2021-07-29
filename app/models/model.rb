class Model < ApplicationRecord
  belongs_to :make
  has_many :variants
  has_one :year
end
