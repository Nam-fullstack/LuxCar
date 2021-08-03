class ConversationsController < ApplicationController
  before_action :authenticate_user!
  
  # Shows all conversations for the current user 
  def index
    @users = User.where.not(id: current_user.id)
    @conversations = Conversation.where("sender_id = ? OR receiver_id = ?", current_user.id, current_user.id)
  end

  # Checks if conversation between sender and recipient already exists and assigns
  # it to an instance variable, else, it creates a new conversation.
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
