class EventsController < ApplicationController
  before_action :authenticate_user!
  before_action :authorize_buyer
  before_action :redirect_seller, only: %i[ new create ]
  before_action :authorize_seller, only: %i[ index show edit update delete ]
  before_action :set_purchase_listing, only: %i[ new create index ]
  before_action :set_vars, only: %i[ show edit update destroy ]
  before_action :set_event, only: %i[ index show ]

  # Scopes query to the dates being shown
  def index
    start_date = params.fetch(:start_date, Date.today).to_date
    # @events = Events.where(starts_at: start_date.beginning_of_month.beginning_of_week..start_date.end_of_month.end_of_week)
  end

  def show
  end

  def new
    @event = Event.new
    puts "\n\n\n EVENTS NEW THIS IS THE PARAMS: #{params} \n\n NEW EVENT:"
    pp @event
    puts " \n\n @purchase: "
    pp @purchase
    puts "\n\n"
  end

  def edit
    puts "\n\n =========== EDIT PAGE: listing: #{@listing} ========\n\n @PURCHASE: \n"
    pp @purchase
    puts "\n\n @EVENT: \n"
    pp @event
  end

  # ================== THIS COMMENT IS OLD ==========================
  # Creates new event with params from form, then adds sets the listing_id that was passed
  # in params from payments success.html.erb
  def create
    puts "\n\nBELOW IS EVENT PARAMS \n\n"
    pp event_params
    @event = Event.new(event_params)
    puts "\n\n ===== this is the @purchase.id: \n\n"
    pp @purchase.id
    @event.purchase_id = @purchase.id
    puts "\n\n ====== DOES IT REGISTRER THE purchase_id IN CREATE NOW? purchase.id #{@purchase.id} \n LISTING.ID #{@listing}\n"

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
    puts "\n\n\n\n this is the params passed to CHANGE_CONFIRMED \n"
    pp params
    @event = Event.find_by(id: params[:id])
    @event.update(confirmed: true)
    puts "\n\n\n EVENT UPDATED WITH CONFIRMED: TRUE\n" 
    pp @event
    # redirect_to events_path
    redirect_back fallback_location: events_path, notice: 'Event has been confirmed.'
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
  # the queries on the Purchases table where the seller_id matches the user's.
  def authorize_seller
    if is_seller && seller_has_buyers
      # refactored into one line.
      @events = Event.joins(:purchase).where(purchase: { seller_id: current_user.id })
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
    !Purchase.find_by(seller_id: current_user.id).nil?
  end

  def user_purchase
    @purchase = Purchase.find_by(buyer_id: current_user.id) if has_purchased
    # redirect_back fallback_location: listings_path if !is_seller
  end

  def has_purchased
    !Purchase.find_by(buyer_id: current_user.id).nil?
  end

  # If the user has any listings, or if they have made any purchases (deposits), only then, allow them to
  def set_purchase_listing
    user_purchase
    get_listing
    puts "\n\n ============ SET PURCHASE: #{@purchase} and the listing ID: #{@listings || @listing} \n\n @purchase:"
    pp @purchase
    puts "\n @listings: "
    pp @listings
    puts "\n\n @listing: "
    pp @listing

    puts "\n\n @events:\n"
    pp @events
  end

  # If user has made a purchase, then assigns @listing to the corresponding listing using the listing_id 
  # from the purchases table. Otherwise, checks to see if the user is a seller, if not, redirects to listings#index
  # If user is signed in and a seller, assigns all their listings to @listings.
  def get_listing
    if has_purchased
      @listing = Listing.find_by(id: @purchase.listing_id)
    elsif is_seller
      @listings = current_user&.listings # Listing.where(user_id: current_user.id)  => ActiveRecord 1.2 ms vs 3.0ms
    else
      redirect_back fallback_location: listings_path
    end
  end

  # Only assigns @events to the query where Events that have the purchase_id that corresponds to the Purchases where
  # the buyer_id matches the current_user.id. So if a seller has not made any purchases, it does not override what is 
  # already stored for their set of events. Need to factor in if the seller has listings and has also made a purchase
  # to add  
  def set_event
    if is_seller && has_purchased
      purchase_events = Event.joins(:purchase).where(purchase: { buyer_id: 1 })
      # @events already stores all the events related to purchases that belong to the seller's listing. So need to 
      # combine the two to show all the possible events linked to the user where they're the seller and events where
      # they're the buyer as well. This is achieved using #or method, which is the same as #union.
      @events.or(purchase_events)
    end
    @events = Event.all.where(purchase_id: @purchase) if !is_seller && has_purchased
  end

  def set_vars
    user_purchase
    puts "\n\n\n ######### SET VARS THIS IS PP PURCHASE  ########## \n\n"
    pp @purchase

    get_listing
    puts "\n\n ============ SET VARS: @listing_id: #{@listings || @listing} \n"

    if has_purchased
      @event = Event.find_by(purchase_id: @purchase.id) 
    else
      @event = Event.find_by(id: params[:id])
    end
    puts "\n\n ====== THIS IS THE @PURCHASE ID: #{@purchase.id} \n\n" if has_purchased
    # @event = Event.find_by_purchase_id(@purchase.id)
    puts "listing id: "
    pp @listing
    puts "\n\n and pp event below: #{@event} \n\n"
    pp @event
  end
end
