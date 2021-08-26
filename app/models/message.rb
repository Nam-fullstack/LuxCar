class Message < ApplicationRecord
  belongs_to :conversation
  belongs_to :user
  
  validates :body, presence: true, length: { maximum: 1000 }
  before_save :remove_whitespace

  private

  def remove_whitespace
    self.body = body.strip if respond_to?(:strip)
  end
end
