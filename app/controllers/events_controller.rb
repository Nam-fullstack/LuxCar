class EventsController < ApplicationController
  before_action :set_listing, only: %i[ new ]
  before_action :set_event, only: %i[ index show edit update destroy ]
  # before_action :authenticate_user!
  # before_action :authorize_user, only: %i[ show edit update destroy ]

  # Scopes query to the dates being shown
  def index

    @events = Event.all.where(listing_id: @listings)
    start_date = params.fetch(:start_date, Date.today).to_date
    puts "\n\nEVENTS CONTROLLER: start_date #{start_date} \n\n "
    # @events = Events.where(starts_at: start_date.beginning_of_month.beginning_of_week..start_date.end_of_month.end_of_week)
    puts "\n\nEVENTS CONTROLLER: @events #{@events} \n\n "
  end

  def show
    @event
  end

  def new
    @event = Event.new
    # puts "\n\n\n EVENTS NEW THIS IS THE PARAMS: #{params} \n\n @event: #{@event}\n\n Listing id: #{@listing}"
  end

  def edit
  end

  def create
    # Creates new event with params from form, then adds sets the listing_id that was passed
    # in params from payments success.html.erb
    @event = Event.new(event_params)
    @event.listing_id = @listing

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
  def set_listing
    @listing = params[:listing_id]
  end

  def set_event
    @listings = Purchase.where(buyer_id: current_user.id).pluck(:listing_id)
    @events = Event.where(listing_id: @listings)
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
    params.require(:event).permit(:listing_id, :name, :start_time, :address, :postcode, :message, :confirmed, :buyer_id, :deposit_paid)
  end

end
