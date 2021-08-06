class Listing < ApplicationRecord
  # Associations
  belongs_to :user
  has_one :variant
  has_one :colour
  has_many :features, through: :listings_features, dependent: :destroy
  has_many :listings_features
  accepts_nested_attributes_for :listings_features
  has_many_attached :images
  has_many :profiles, through: :watches
  has_one :purchase, dependent: :destroy
  has_one :state
  has_many :watches, dependent: :destroy

  # Validations
  validates :description, length: { maximum: 1000 }
  validates :mileage, numericality: { greater_than: 0 }
  validates :price, presence: true, numericality: { greater_than: 50000 }
  validates :state_id, presence: true
  validates :postcode, presence: true, length: { is: 4 }, numericality: { greater_than: 0200, less_than: 9999 }
  validates :title, length: { maximum: 100 }
  # validates :variant_id, presence: true
  
  before_save :remove_whitespace
  before_validation :convert_price_to_cents, if: :price_changed?
  # before_save :create_variant

  # @door_join = Door.left_joins(:body_type)

  private

  def remove_whitespace
    self.title = title.strip
    self.description = description.strip
  end

  def convert_price_to_cents
    self.price = price * 100
  end

  # def create_variant
    # @new_variant = { params[:listing][:year_id], params[:listing][:model_id], params[:listing][:door_id], params[:listing][:body_type_id], params[:listing][:speed_id], params[:listing][:transmission_id], params[:listing][:engine_id], params[:listing][:petrol_id] }
    # Variant.create()
  # end
end
