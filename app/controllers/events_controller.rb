class EventsController < ApplicationController
  before_action :set_purchase_listing, only: %i[ new create index ]
  before_action :set_vars, only: %i[ show edit update destroy ]
  before_action :set_event, only: %i[ index show ]
  # before_action :authenticate_user!
  # before_action :authorize_user, only: %i[ show edit update destroy ]

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
    puts" \n\n @purchase: "
    pp @purchase
    puts "\n\n"
  end

  def edit
    puts "\n\n =========== EDIT PAGE: listing: #{@listing} ========\n\n @PURCHASE: \n"
    pp @purchase 
    puts "\n\n @EVENT: \n"
    pp @event
  end

  def create
    # Creates new event with params from form, then adds sets the listing_id that was passed
    # in params from payments success.html.erb
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

  # Changes status of event to being confirmed true.
  def confirm_event
    @event.update(confirmed: true)
  end
  
  private

  # Gets the listing_id from params specified in payments success.html.erb Book A Test Drive button
  def set_purchase_listing
    user_purchase
    get_listing
    puts "\n\n ============ SET PURCHASE: #{@purchase} and the listing ID: #{@listing} \n\n"
  end

  def user_purchase
    @purchase = Purchase.find_by(buyer_id: current_user.id)
  end

  def get_listing
    @listing = Listing.find_by_id(@purchase.listing_id)
  end

  def set_event
    @events = Event.all.where(purchase_id: @purchase)
  end

  def set_vars
    user_purchase
    puts "\n\n\n ######### SET VARS THIS IS PP PURCHASE  ########## \n\n"
    pp @purchase

    get_listing
    puts "\n\n ============ SET VARS: @listing_id: #{@listing} \n"

    @event = Event.find_by(purchase_id: @purchase.id)
    puts "\n\n ====== THIS IS THE @PURCHASE ID: #{@purchase.id} \n\n"
    # @event = Event.find_by_purchase_id(@purchase.id)
    puts "listing id: "
    pp @listing
    puts "\n\n and pp event below: #{@event} \n\n"
    pp @event
  end

  def authorize_user
    # Only allows the user that corresponds to the buyer that has paid the deposit to
    # be able to create an event.
# ================================== MIGHT NEED TO CHECK THIS LATER =======================================
    if current_user.id != @purchase.buyer_id || @purchase.deposit_paid == false
# ================================== MIGHT NEED TO CHECK THIS LATER =======================================
      flash[:error] = "Unauthorized Request!"
      redirect_to listings_path
    end
  end

  # Only allow a list of trusted parameters through.
  def event_params
    params.require(:event).permit(:name, :start_time, :address, :postcode, :message, :confirmed)
  end

end
