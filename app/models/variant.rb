class Variant < ApplicationRecord
  belongs_to :model
  has_many :listings
  has_one :body_type
  has_one :drive
  has_one :engine
  has_one :fuel
  has_one :transmission
  has_one :year

  # These should be optional, so might comment out validations here
  # and validate in form.
  validates :fuel_consumption, numericality: { greater_than: 0 }
  validates :weight, numericality: { greater_than: 0 }
  validates :safety_rating, numericality: { great_than_or_equal_to: 0, less_than_or_equal_to: 5 }

  before_save :update_name

  private

  def update_name
    engine_name = Engine.find(params[:engine_id]).name
    pp engine_name
  end

end
