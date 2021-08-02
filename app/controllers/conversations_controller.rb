class ConversationsController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @users = User.all
    @conversations = Conversation.all
  end

  # Checks if conversation between sender and recipient already exists and sets an instance
  # variable to this conversation, else, it creates a new conversation.
  def create  
    if Conversation.between(params[:sender_id], params[:recipient_id]).exists?  #.present => 900ms, .any => 100ms, .exists => 1ms  
       @conversation = Conversation.between(params[:sender_id], params[:recipient_id]).first
    else
       @conversation = Conversation.create!(conversation_params)
    end
    redirect_to conversation_messages_path(@conversation)
  end

  private
  
  def conversation_params
    params.permit(:sender_id, :recipient_id)
  end
end
