class EventsController < ApplicationController
  before_action :set_listing, only: %i[ show edit update destroy ]
  # before_action :authenticate_user!
  # before_action :authorize_user, only: %i[ show edit update destroy ]

  # Scopes query to the dates being shown
  def index
    # @events = Event.all
    start_date = params.fetch(:start_date, Date.today).to_date
    @events = Events.where(starts_at: start_date.beginning_of_month.beginning_of_week..start_date.end_of_month.end_of_week)
  end

  def show
  end

  def new
    @event = Event.new(event_params)
    puts "\n\n\n EVENTS NEW THIS IS THE PARAMS: #{params} \n\n @event: #{@event}\n\n Listing id: #{@listing_id}"
  end

  def edit
  end

  def create
    # @event = Event.new(listing_id: @listing, address: params[:address], postcode: params[:postcode], name: params[:name], start_time: params[:start_time], message: params[:message], confirmed: false)
    @event = Event.new(event_params)
    pp @event
    puts "\n\n\n\n Events CREATE: listing below\n"
    pp @listing
    puts "\n\n event details: #{@event} \n\n This is the listing id: #{@listing} \n\n"

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

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_listing
    @listing = params[:listing_id]
    puts "\n\nthis is before action: #{@listing}\n\n"
  end

  def authorize_user
    # Only allows the user that corresponds to the buyer that has paid the deposit to
    # be able to create an event.
    if current_user.id != @purchase.buyer_id || @purchase.deposit_paid == false
      flash[:error] = "Unauthorized Request!"
      redirect_to listings_path
    end
  end

  # Only allow a list of trusted parameters through.
  def event_params
    params.require(:event).permit(:listing_id, :name, :start_time, :address, :postcode, :message, :confirmed, :buyer_id, :deposit_paid)
  end

end
