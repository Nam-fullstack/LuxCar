class Conversation < ApplicationRecord
  # This setups up a self join within the Conversation model for the User model.
  # Allows for a user to be both the sender and recipient of messages.
  belongs_to :sender, foreign_key: :sender_id, class_name: 'User'
  belongs_to :recipient, foreign_key: :recipient_id, class_name: 'User'
  has_many :messages, dependent: :destroy
  
  # Defines a conversation that is unique for sender based on the recipient.
  # Sender and recipient can't have multiple conversations.
  validates_uniqueness_of :sender_id, scope: :recipient_id
  # Finds the conversation between the two users
  scope :between, ->(sender_id, recipient_id) do
    where("(conversations.sender_id = ? AND conversations.recipient_id =?) OR (conversations.sender_id = ? AND conversations.recipient_id =?)", sender_id, recipient_id, recipient_id, sender_id)
  end

  def recipient(current_user)
    self.sender_id == current_user.id ? self.recipient : self.sender
  end
end
