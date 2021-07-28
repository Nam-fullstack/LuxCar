class Model < ApplicationRecord
  belongs_to :make
  belongs_to :variant
  belongs_to :year
end
