class Conversation < ApplicationRecord
  # This setups up a self join within the Conversation model for the User model.
  # Allows for a user to be both the sender and receiver of messages.
  belongs_to :sender, foreign_key: 'sender_id', class_name: 'User'
  belongs_to :receiver, foreign_key: 'receiver_id', class_name: 'User'
  has_many :messages, dependent: :destroy
  
  # Defines a conversation that is unique for sender based on the receiver.
  # Sender and receiver can't have multiple conversations.
  validates_uniqueness_of :sender_id, scope: :receiver_id
  # Finds the conversation between the two users
  scope :between, ->(sender_id, receiver_id) do
    where("(conversations.sender_id = ? AND conversations.receiver_id =?) OR (conversations.sender_id = ? AND conversations.receiver_id =?)", sender_id, receiver_id, receiver_id, sender_id)
  end

  def recipient(current_user)
    self.sender_id == current_user.id ? self.receiver : self.sender
  end
end
