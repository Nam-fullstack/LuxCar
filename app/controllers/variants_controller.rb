class VariantsController < ApplicationController
  before_action :set_variant, only: %i[ show edit update destroy ]
  before_action :authenticate_user!
  before_action :authorize_user!, only: %i[ edit update destroy ]

  def new
    @variant = Variant.new
  end

  def create
    @variant = Variant.new(variant_params)

    respond_to do |format|
      if @variant.save
        format.html { redirect_to @variant, notice: "Your car variant was successfully created." }
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
        format.html { redirect_to @variant, notice: "Variant was successfully updated." }
        format.json { render :show, status: :ok, location: @variant }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @variant.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def set_variant
    @variant = variant.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def variant_params
    params.require(:variant).permit(:year_id, :make_id, :model_id, :engine_id, :transmission_id, :speed_id, :fuel_id, :body_type_id, :door_id, :drive_type_id)
  end

  def set_form_vars
    @makes = Make.all
    @model = Model.all
  end
end
