class VariantsController < ApplicationController
  before_action :set_listing, only: %i[ edit update destroy ]
  before_action :authenticate_user!
  before_action :authorize_user, only: %i[ edit update destroy ]

  def new
    @variant = Variant.new
  end

  def create
    @variant = Variant.new(variant_params)

    respond_to do |format|
      if @variant.save
        update_name(0)
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
        update_name(1)
        format.html { redirect_to listing_path, notice: "Variant was successfully updated." }
        format.json { render :show, status: :ok, location: @variant }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @variant.errors, status: :unprocessable_entity }
      end
    end
  end

  # Gets make form selection to pre-populate the associated Models that belongs to that Make.
  def get_models
    @make = Make.find params[:make_id]

    puts "\n\n\n\n\n\n ################ MAKE: #{@make}"
    @models = @make.models
    puts "\n\n\n\n\n\n ################ MODELS: #{@models}"
  end

  private

  # Only allow a list of trusted parameters through.
  def variant_params
    params.require(:variant).permit(:year_id, :make_id, :model_id, :engine_id, :transmission_id, :speed_id, :fuel_id, :body_type_id, :door_id, :drive_type_id, :displacement, :power, :colour_id)
  end

  def authorize_user
    if current_user.id != @listing.user.id
      flash[:error] = "Unauthorized Request!"
      redirect_to listings_path
    end
  end

  def set_listing
    @listing = Listing.find_by_variant_id(params[:id])
    puts "\n\n\n\n this is the set_listing from params @listing #{@listing}"
    @variant = Variant.find_by_id(params[:id])
  end

  def update_name(new_or_edit)
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

    if trans == "Automatic"
      trans = "Auto"
    else
      trans = "Man"
    end

    case new_or_edit
    when 0
      Variant.last.update(name: "#{year} #{make} #{model} #{params[:variant][:displacement]}L #{engine} #{door}dr #{body} #{speed}-sp #{trans} #{drive} #{fuel}")
    when 1
      @variant.update(name: "#{year} #{make} #{model} #{params[:variant][:displacement]}L #{engine} #{door}dr #{body} #{speed}-sp #{trans} #{drive} #{fuel}")
    end
  end
end
