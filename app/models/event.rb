class Event < ApplicationRecord
  belongs_to :purchase

  before_save :remove_whitespace

  validates :name, presence: true, length: { maximum: 50 }
  validates :address, presence: true, length: { maximum: 100 }
  # Australian postcodes only exist in this range: 0200 to 9999
  validates :postcode, presence: true, numericality: { greater_than_or_equal_to: 0200, less_than: 9999 }
  validates :start_time, presence: true

  extend SimpleCalendar
  # has_calendar :attribute => :start_time

  private

  def remove_whitespace
    self.attributes.each { |key, value| self[key] = value.strip if value.respond_to?(:strip) }
  end
end
