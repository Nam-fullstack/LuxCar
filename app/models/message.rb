class Message < ApplicationRecord
  belongs_to :conversation
  belongs_to :user
  
  validates_presence_of :body, :conversation_id, :user_id, length: { maximum: 1000 }

  before_save :remove_whitespace

  private

  def remove_whitespace
    self.body = body.strip
  end
end
