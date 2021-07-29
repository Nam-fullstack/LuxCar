class Listing < ApplicationRecord
  belongs_to :user
  has_one :make
  has_one :model
  has_one :variant
  has_one :year, through: :model
  has_many :features, through: :listings_features
  accepts_nested_attributes_for :listings_features
  has_many_attached :pictures
end
