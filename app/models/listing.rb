class Listing < ApplicationRecord
  # Associations
  belongs_to :user
  belongs_to :variant
  has_one :colour
  has_many :features, through: :listings_features, dependent: :destroy
  has_many_attached :images
  has_many :listings_features
  accepts_nested_attributes_for :listings_features
  has_many :profiles, through: :watches
  has_one :purchase, dependent: :destroy
  has_one :state
  has_many :watches, dependent: :destroy
end
