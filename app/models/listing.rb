class Listing < ApplicationRecord
  # Associations
  belongs_to :user
  belongs_to :variant
  has_many :listings_features
  has_many :features, through: :listings_features, dependent: :destroy
  accepts_nested_attributes_for :listings_features
  has_many_attached :pictures
  has_many :watches, dependent: :destroy
  has_many :profiles, through: :watches
  has_many :purchases, dependent: :destroy
  has_many :events, through: :purchase, dependent: :destroy
  belongs_to :state
  has_one :make, through: :variant
  has_one :year, through: :variant  # makes year accessible from listing to sort by year

  # Validations
  validates :description, length: { maximum: 1000 }
  validates :mileage, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :price, presence: true, numericality: { greater_than: 50000 }
  validates :state_id, presence: true
  # Australian postcodes only exist in this range: 0200 to 9999
  validates :postcode, presence: true, numericality: { greater_than_or_equal_to: 0200, less_than_or_equal_to: 9999 }
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
  end

  # Before validation, converts the price to cents, if it has cents or any decimal
  # value, that value will be lost when the type gets converted into integer. So this
  # converts it to float before it's changed to an integer, and we can do the conversion to
  # cents without losing that data. Although, at this price bracket, cents shouldn't really matter
  def convert_price_to_cents
    self.price = (self.attributes_before_type_cast["price"].to_f * 100).round
  end

  def self.search(query, option)
    if query
      # % % matches just part of the query on either side when the title (option)
      # is in lowercase, essentially when it is like the string in downcase
      return self.where("LOWER(#{option}) LIKE ?", "%#{query.downcase}%")
    end
    return self.all
  end

  # Filter listings by Make id, joins Listings to Makes through the association: 
  # Selects Listings linked to variant using variant_id, joins to the model on model_id, joins
  # to the make on make_id, where the make_id is the passed in value. So this just returns listings
  # that have an associated make id of i.e. 1, aka Aston Martin. 
  def self.filter(make)
    if make
      return self.joins(variant: :make).where(make: { id: make })
    else
      return self.all
    end
  end

  # Gets the optional value passed in from the views for :sort in params from the Listings Controller
  # Using a case statement, defines how to sort/order the listings. 
  def self.sorted(sort)
    case sort
    when 1
      return self.order(price: :asc)
    when 2
      return self.order(price: :desc)
    when 3
      # Joins Listings to Year which enables to sort by year which is two tables away
      return self.joins(variant: :year).order(year: :desc)  
    when 4
      return self.joins(variant: :year).order(year: :asc)
    when 5
      return self.joins(:variant).order(power: :desc)
    when 6
      return self.order(mileage: :asc)
    when 7
      return self.order(created_at: :desc)
    else
      return self.all
    end
  end
end
