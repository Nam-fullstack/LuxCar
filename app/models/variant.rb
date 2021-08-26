class Variant < ApplicationRecord
  belongs_to :model
  has_one :make, through: :model
  has_many :listings, dependent: :destroy
  belongs_to :door
  has_one :body_type, through: :door
  belongs_to :drive_type
  belongs_to :engine
  belongs_to :fuel
  belongs_to :year
  belongs_to :speed
  has_one :transmission, through: :speed
  belongs_to :colour

  validates :displacement, numericality: { greater_than_or_equal_to: 0, less_than: 20 }

  before_save :remove_whitespace

  private
  
# *************************************************************************
# Number_field in form doesn't allow for spaces or letters to be typed, but method
# below sanitizes all attibutes/data input.
# *************************************************************************

  def remove_whitespace
    self.attributes.each { |key, value| self[key] = value.strip if value.respond_to?(:strip) }
  end
end
