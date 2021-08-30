class EventsController < ApplicationController
  before_action :authenticate_user!
  before_action :authorize_buyer
  before_action :redirect_seller, only: %i[ new create ]
  before_action :authorize_seller, only: %i[ index show edit update delete ]
  before_action :set_purchase_listing, only: %i[ new create index ]
  before_action :set_vars, only: %i[ show edit update destroy ]
  before_action :set_event, only: %i[ index show ]
  before_action :has_purchased, only: %i[ new create ]
  # before_action :no_event, only: %i[ new create ]

  # Scopes query to the dates being shown
  def index
    start_date = params.fetch(:start_date, Date.today).to_date
  end

  def show
    redirect_to events_path
  end

  def new
    @event = Event.new
  end

  def edit
  end

  # ================== THIS COMMENT IS OLD ==========================
  # Creates new event with params from form, then adds sets the listing_id that was passed
  # in params from payments success.html.erb
  def create
    @event = Event.new(event_params)
    @event.purchase_id = @purchase.id

    respond_to do |format|
      if @event.save
        format.html { redirect_to @event, notice: "Event was successfully created." }
        format.json { render :show, status: :created, location: @event }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @event.update(event_params)
        format.html { redirect_to @event, notice: "Event was successfully updated." }
        format.json { render :show, status: :ok, location: @event }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @event.destroy
    respond_to do |format|
      format.html { redirect_to events_url, notice: "Event was successfully deleted." }
      format.json { head :no_content }
    end
  end

  def change_confirmed
    @event = Event.find(params[:id])
    @event.update(confirmed: true)

    # redirect_to events_path
    redirect_back fallback_location: events_path, notice: 'Event has been confirmed.'
  end

  def no_event
    purchase = Purchase.where(buyer_id: current_user.id).last

    if purchase && Event.find_by(purchase_id: purchase.id).nil? 
      return true
    end
  end

  private

  # Only allow a list of trusted parameters through.
  def event_params
    params.require(:event).permit(:name, :start_time, :address, :postcode, :message, :confirmed)
  end

  # Only allows the user that corresponds to the buyer that has paid the deposit to
  # be able to create an event. If user is not a seller and hasn't made any purchases (deposits)
  # then they're redirected back to listings#index. Methods are in events_helper.
  def authorize_buyer
    if !is_seller && !has_purchased
      flash[:error] = "Unauthorized Request! Need to pay deposit to book a test drive." 
      redirect_to listings_path
    end
  end

  # Queries Events table for events that matches the purchase_id(s) that corresponds with
  # the queries on the Purchases table where the seller_id matches the user's. If the user is 
  # a seller, but doesn't have any buyers (or users that have paid deposit to test drive), then
  # there won't be an entry in the Purchase table that has a corresponding seller_id for that user.
  # They will, however, have a listing, which is checked in the is_seller method.
  def authorize_seller
    if is_seller && seller_has_buyers
      # refactored into one line, rather than doing two separate queries to get the Purchase
      # where seller_id matchers current user's id and then querying the Events table for records
      # that match the id from the Purchase in the first query.

      # The most efficient way to query the Events table for events that correspond to the user's id
      # without having to create another column on the Events table with buyer and seller id is to 
      # get the ids for the purchases that corresponds to the user, using "seller_id" to select the purchases
      # for that user using the association in the users model: 
      # has_many :sold_cars, class_name: "Purchase", foreign_key: "seller_id"

      @events = Event.where(purchase_id: current_user.sold_cars.ids)  # Event load (0.3ms)
      # Event.joins(:purchase).where(purchase: { seller_id: current_user.id })   vs 0.4ms
      # Event.where(purchase_id: current_user.sold_cars.select(:id))             vs 0.6ms  

    end
  end

  # Seller can't create an event if they haven't made any purchases and gets redirected.
  def redirect_seller
    if is_seller && !has_purchased
      flash[:error] = "Need to pay deposit to book a test drive." 
      redirect_to listings_path
    end
  end

  def is_seller
    current_user&.listings.count.positive?
  end

  # Determines if the current seller has any buyers that have made purchases using seller_id,
  # and returns true if this doesn't evaluate to nil.
  def seller_has_buyers
    !current_user.sold_cars.empty?
    # [negate operator]Purchase.find_by(seller_id: current_user.id).empty?      # same AR time in console.
  end

  def user_purchase
    @purchase = current_user.bought_cars.last if has_purchased                      # 0.3 ms
    # @purchase = Purchase.where(buyer_id: current_user.id).last if has_purchased   # 0.3 ms
    @purchases = current_user.bought_cars if has_purchased
  end

  def has_purchased
    !current_user&.bought_cars.empty?                                        # 0.3ms
    # [negate operator]Purchase.find_by(buyer_id: current_user.id).empty?    # 0.3ms Same time, just easier to read

  end

  def set_purchase_listing
    user_purchase
    get_listing
  end

  # If the user isn't a seller or hasn't paid a deposit (has_purchased), then they are redirected to listings#index.
  # If user has made a purchase, then assigns @listing to the corresponding listing using the listing_id 
  # from their associated purchase. Finally, checks to see if the user is a seller, assigns all their listings to @listings.
  def get_listing   
    redirect_to listings_path if !is_seller && !has_purchased
    @listing = Listing.find_by(id: @purchase.listing_id) if has_purchased
    @listings = current_user&.listings if is_seller # Listing.where(user_id: current_user.id)  => ActiveRecord 1.2 ms vs 3.0ms
  end

  # Only assigns @events to the query where Events that have the purchase_id that corresponds to the Purchases where
  # the buyer_id matches the current_user.id. So if a seller has not made any purchases, it does not override what is 
  # already stored for their set of events.
  def set_event
    if is_seller && has_purchased
      seller_purchases = Event.where(purchase_id: current_user&.bought_cars.ids)                      # 0.3ms
      # seller_purchases = Event.joins(:purchase).where(purchase: { buyer_id: current_user.id })        0.5ms

      # @events already stores all the events(test drives) related to purchases that belong to the seller's listing(s) which
      # was assigned in authorize_seller method. If the seller makes any purchases, need to combine the events where the 
      # seller is going to test drive with the events where the seller has buyers test driving their listings. 
      # So need to show all the possible events linked to the user where they're the seller and events where they're 
      # the buyer as well. This is achieved using #or method, which is the same as #union.
      @events = @events.or(seller_purchases)    # combines events where seller and events where buyer together
    else
      @events = Event.where(purchase_id: @purchases.ids) if !is_seller && has_purchased
    end
  end

  def set_vars
    user_purchase
    get_listing
    @event = Event.find_by(id: params[:id])
  end
end
