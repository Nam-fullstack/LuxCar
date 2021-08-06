class VariantsController < ApplicationController
  before_action :authenticate_user!
  before_action :authorize_user!, only: %i[ edit update destroy ]

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
        format.html { redirect_to new_listing_path, notice: "Variant was successfully updated." }
        format.json { render :show, status: :ok, location: @variant }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @variant.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  # Only allow a list of trusted parameters through.
  def variant_params
    params.require(:variant).permit(:year_id, :make_id, :model_id, :engine_id, :transmission_id, :speed_id, :fuel_id, :body_type_id, :door_id, :drive_type_id)
  end

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

    if trans == "Automatic"
      trans = "Auto"
    else
      trans = "Man"
    end

    Variant.last.update(name: "#{year} #{make} #{model} #{door}dr #{body} #{speed}-sp #{trans} #{engine} #{drive} #{fuel}")
    puts "THIS IS THE NAME: #{Variant.last.name}"
  end
end
