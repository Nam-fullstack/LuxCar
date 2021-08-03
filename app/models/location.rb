class Location < ApplicationRecord
  belongs_to :event, dependent: :destroy

  # Validations
  validates :postcode, presence: true, length: { is: 4 }, numericality: { greater_than: 0200, less_than: 9999 }
  validates :address, presence: true

  before_save :remove_whitespace

  private

  def remove_whitespace
    self.address = address.strip
  end
end
