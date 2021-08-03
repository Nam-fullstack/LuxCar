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

  # Validations
  validates :description, length: { maximum: 1000 }
  validates :mileage, numericality: { greater_than: 0 }
  validates :price, presence: true, numericality: { greater_than: 50000 }
  validates :state_id, presence: true
  validates :title, length: { maximum: 50 }
  # validates :variant_id, presence: true
  
  before_save :remove_whitespace

  private

  def remove_whitespace
    self.title = title.strip
    self.description = description.strip
  end

end
