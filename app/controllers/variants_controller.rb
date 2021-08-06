class VariantsController < ApplicationController
  before_action :set_variant, only: %i[ show edit update destroy ]
  before_action :authenticate_user!
  before_action :authorize_user!, only: %i[ edit update destroy ]

  def create
    @variant =  Variant.new(variant_params)
    

    respond_to do |format|
      if @variant.save
        format.html { redirect_to @variant, notice: "Your car variant was successfully created." }
        format.json { render :show, status: :created, location: @variant }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @listing.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_variant
    @variant = Variant.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def variant_params
    params.require(:variant).permit(:year_id, :make_id, :model_id, :engine_id, :transmission_id, :fuel_id, :body_type_id, :drive_type_id, :image)
  end

  def set_form_vars
    @makes = Make.all
    @model = Model.all
  end
end
