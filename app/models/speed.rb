class Speed < ApplicationRecord
  belongs_to :transmission
  has_many :variants
end
