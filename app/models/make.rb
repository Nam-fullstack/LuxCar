class Make < ApplicationRecord
  has_many :models
  has_many :variants, through: :model
end
