class Variant < ApplicationRecord
  belongs_to :model
  has_one :make, through: :model
  has_many :listings, dependent: :destroy
  has_one :door
  has_one :body_type, through: :door
  has_one :drive
  has_one :engine
  has_one :fuel
  has_one :year
  has_one :speed
  has_one :transmission, through: :speed
  has_one :colour

  validates :displacement, numericality: { greater_than: 0, less_than: 20 }

  before_save :remove_whitespace

  private
# *************************************************************************
# number_field in form doesn't allow for spaces or letters to be typed.
# *************************************************************************

  def remove_whitespace
    self.displacement = displacement.strip if self.respond_to?(:strip)
    self.power = power.strip if self.respond_to?(:strip)
  end
end
