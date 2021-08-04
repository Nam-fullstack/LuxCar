class PaymentsController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:webhook]
  before_action :authenticate_user!, only: [:success]

  def success
    @title = params[:title]
  end

  def webhook
    payment_id = params[:data][:object][:payment_intent]
    payment = Stripe::PaymentIntent.retrieve(payment_id)
    
    pp payment

    listing_id = payment.metadata.listing_id
    buyer_id = payment.metadata.user_id

    # Changes listing to SOLD
    Listing.find(listing_id).update(sold: true)
  end
end
