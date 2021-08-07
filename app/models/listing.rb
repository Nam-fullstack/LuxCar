class Listing < ApplicationRecord
  # Associations
  belongs_to :user
  has_one :variant
  has_one :colour
  has_many :listings_features
  has_many :features, through: :listings_features, dependent: :destroy
  accepts_nested_attributes_for :listings_features
  has_many_attached :pictures
  has_many :profiles, through: :watches
  has_one :purchase, dependent: :destroy
  has_one :state
  has_many :watches, dependent: :destroy

  # Validations
  validates :description, presence: true, length: { maximum: 1000 }
  validates :mileage, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :price, presence: true, numericality: { greater_than: 50000 }
  validates :state_id, presence: true
  # Australian postcodes only exist in this range: 0200 to 9999
  validates :postcode, presence: true, numericality: { greater_than: 0200, less_than: 9999 }
  validates :variant_id, presence: true
  
  before_save :remove_whitespace
  before_validation :convert_price_to_cents, if: :price_changed?

  private

  def remove_whitespace
    self.title = title.strip
    self.description = description.strip
  end

  # Before validation, converts the price to cents, if it has cents or any decimal
  # value, that value will be lost when the type gets converted into integer. So this
  # converts it to float before it's changed to an integer, and we can do the conversion
  # to cents without losing that data.
  def convert_price_to_cents
    # Only multiplying by 10 because only paying for 10% deposit, also, Stripe doesn't
    # allow for payments that is above 1 million dollars. The buyer and seller will handle
    # the remainder of payment with their banks.
    self.price = (self.attributes_before_type_cast["price"].to_f * 10).round
  end
end
