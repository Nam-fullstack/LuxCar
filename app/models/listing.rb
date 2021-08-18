class Listing < ApplicationRecord
  # Associations
  belongs_to :user
  belongs_to :variant
  has_many :listings_features
  has_many :features, through: :listings_features, dependent: :destroy
  accepts_nested_attributes_for :listings_features
  has_many_attached :pictures
  has_many :profiles, through: :watches
  has_one :purchase, dependent: :destroy
  belongs_to :state
  has_many :watches, dependent: :destroy
  has_one :event, dependent: :destroy
  has_one :make, through: :variant
  has_many :events, through: :purchase

  # Validations
  validates :description, length: { maximum: 1000 }
  validates :mileage, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :price, presence: true, numericality: { greater_than: 50000 }
  validates :state_id, presence: true
  # Australian postcodes only exist in this range: 0200 to 9999
  validates :postcode, presence: true, numericality: { greater_than_or_equal_to: 0200, less_than: 9999 }
  validates :variant_id, presence: true

  # Trying to refactor callbacks into one line.
  # before_save :remove_whitespace, on: :title, :mileage, :price, :postcode, :description
  before_save :remove_whitespace
  before_validation :convert_price_to_cents, if: :price_changed?
  
  # before_save :determine_deposit
  # before_validation :determine_deposit, if: :price_changed?
  
  private

  def remove_whitespace
    self.attributes.each { |key, value| self[key] = value.strip if value.respond_to?(:strip) }
  
    # self.title = title.strip if respond_to?(:strip)
    # self.mileage = mileage.strip if respond_to?(:strip)
    # self.price = price.strip if respond_to?(:strip)
    # self.postcode = postcode.strip if respond_to?(:strip)
    # self.description = description.strip if respond_to?(:strip)
  end

  # Before validation, converts the price to cents, if it has cents or any decimal
  # value, that value will be lost when the type gets converted into integer. So this
  # converts it to float before it's changed to an integer, and we can do the conversion
  # to cents without losing that data.
  def convert_price_to_cents
    self.price = (self.attributes_before_type_cast["price"].to_f * 100).round
  end

  def self.search(query, option)
    if query
      # % % matches just part of the query on either side when the title 
      # is put in lowercase, when it is like the string in downcase
      return self.where("LOWER(#{option}) LIKE ?", "%#{query.downcase}%")
    end
    return self.all
  end

  # Method to filter listings by Make id. Association: Listing has a variant, which belongs
  # to a model, which belongs to a make.
  def view_by(make)
    @listings = Listing.includes(variant: :make).where(make: { id: make })
  end
end
