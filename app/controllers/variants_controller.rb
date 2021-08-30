class VariantsController < ApplicationController
  before_action :set_listing, only: %i[ edit update update_name destroy ]
  before_action :authenticate_user!
  before_action :authorize_user, only: %i[ edit update destroy ]

  def new
    @variant = Variant.new
  end

  def create
    @variant = Variant.new(variant_params)

    respond_to do |format|
      if @variant.save
        update_name
        format.html { redirect_to new_listing_path, notice: "Your car variant was successfully created." }
        format.json { render :show, status: :created, location: @variant }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @variant.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
  end

  def update
    respond_to do |format|
      if @variant.update(variant_params)
        update_name
        format.html { redirect_to listing_path, notice: "Variant was successfully updated." }
        format.json { render :show, status: :ok, location: @variant }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @variant.errors, status: :unprocessable_entity }
      end
    end
  end

  # Gets make form selection to pre-populate the associated Models that belongs to that Make. 
  # Was trying to have dynamic forms with AJAX, but coffee script doesn't work in Rails 6.

  # def get_models
  #   @make = Make.find_by_id params[:make_id]
  #   @models = @make.models
  # end

  private

  # Only allow a list of trusted parameters through.
  def variant_params
    params.require(:variant).permit(:year_id, :make_id, :model_id, :engine_id, :transmission_id, :speed_id, :fuel_id, :body_type_id, :door_id, :drive_type_id, :displacement, :power, :colour_id)
  end

  def authorize_user
    # Determines if the user id (in an array) matches the variant's user id, derived from
    # variant -> listing -> user, and pluck selects just the user_id and returns the value in an array.
    # Don't seem to be able to have access to @listings here. 
    if [current_user.id] != @variant.listings.joins(:user).pluck(:user_id)
      flash[:error] = "Unauthorized Request!"
      redirect_to listings_path
    end
  end

  def set_listing
    @variant = Variant.find(params[:id])
    @listing = @variant.listings
  end

  # Gets the name from each of the FK's tables to update the variant's name.
  def update_name
    year = Year.find(params[:variant][:year_id]).year
    make = Make.find(params[:variant][:make_id]).name
    model = Model.find(params[:variant][:model_id]).name
    door = Door.find(params[:variant][:door_id]).name
    body = BodyType.find(params[:variant][:body_type_id]).name
    speed = Speed.find(params[:variant][:speed_id]).name
    trans = Transmission.find(params[:variant][:transmission_id]).name
    engine = Engine.find(params[:variant][:engine_id]).name
    drive = DriveType.find(params[:variant][:drive_type_id]).name
    fuel = Fuel.find(params[:variant][:fuel_id]).name
    
    # Below, you can also do the same thing as above, which would be easier to read, but if the data was normalised even further
    # it would probably be quicker to directly query the table iteslf to find the matching attribute_id and get it's name/value. 
    # The AR time for each of these queries are 0.3ms for both methods with params and chaining from @variant. 
    
    # year = @variant.year.year
    # make = @variant.make.name
    # model = @variant.model.name     and so on..

    if trans == "Automatic"
      trans = "Auto"
    else
      trans = "Man"
    end

    # Updates the variant name, combining the year, make, model, displacement, engine, door, body type, speed, transmission, drive type, 
    # and fuel together. This is just the general standard or naming convention for car variants in the automotive industry, unless the 
    # manufacturer has a specific naming system for their variants in place. This may seem like duplication of data, and a bunch of 
    # unnecessary database calls, but unless the user manually types the variant name out themselves, there's no other way. 
    @variant.update(name: "#{year} #{make} #{model} #{params[:variant][:displacement]}L #{engine} #{door}dr #{body} #{speed}-sp #{trans} #{drive} #{fuel}")
  end
end
