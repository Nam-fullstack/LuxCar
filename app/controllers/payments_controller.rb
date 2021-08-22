class PaymentsController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:webhook]
  before_action :authenticate_user!, only: [:success]

  def success
    @listing = params[:id]
    @purchase = Purchase.find_by_listing_id(params[:id])
  end

  def create_payment_intent
    listing = Listing.find(params[:id])

    # Creates session for Stripe payment
    session = Stripe::Checkout::Session.create(
      payment_method_types: ["card"],
      customer_email: current_user&.email, #current_user && current_user.email
      line_items: [{
        name: listing.title,
        description: listing.description,
        amount: listing.deposit,
        currency: "aud",
        quantity: 1,
      }],
      payment_intent_data: {
        metadata: {
          user_id: current_user&.id,
          listing_id: listing.id,
        },
      },
      success_url: "#{root_url}/success?id=#{listing.id}",
      cancel_url: "#{root_url}/listings",
    )
    @session_id = session.id
  end

  # Didn't get a chance to have an additional separate full payment stripe check where the buyer can pay for the full listing amount
  # and then will update the listing as sold once checkout.session.complete. Can probably still use the same webhook method to get
  # all the payment information, just need to change stripe session to have the amount: as listing.price instead of listing.deposit.

  def webhook
    payment_id = params[:data][:object][:payment_intent]
    payment = Stripe::PaymentIntent.retrieve(payment_id)
    receipt_url = payment.charges.data[0].receipt_url
    listing_id = payment.metadata.listing_id
    buyer_id = payment.metadata.user_id
    listing = Listing.find(listing_id)

    # Only changes deposit paid when payment has been successfully made.

    # Creates a purchase, which has the listing_id (technically don't need seller_id since that data is already stored in the Listings table in user_id column),
    # the buyer_id, payment_id, receipt_url and deposit_paid: to be true. But to make querying easier, added the seller_id in purchase table as well.
    paid = Purchase.create!(listing_id: listing_id, deposit_paid: true, buyer_id: buyer_id, seller_id: listing.user_id, payment_id: payment_id, receipt_url: receipt_url)
  end
end
