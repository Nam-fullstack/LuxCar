class Purchase < ApplicationRecord
  belongs_to :listing
  belongs_to :buyer, foreign_key: 'buyer_id', class_name: "User"
  belongs_to :seller, foreign_key: 'seller_id', class_name: "User"

  before_save :remove_whitespace

  private

  def remove_whitespace
    self.attributes.each { |key, value| self[key] = value.strip if value.respond_to?(:strip) }
  end
end
