class Listing < ApplicationRecord
  belongs_to :user
  has_one :make
  has_one :model, through: :make
  has_one :variant, through: :model
  has_one :year, through: :model
  has_many :listings_features
  has_many :features, through: :listings_features, dependent: :destroy
  accepts_nested_attributes_for :listings_features
  has_many_attached :pictures
end
