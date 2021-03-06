class ListingsController < ApplicationController
  before_action :set_listing, only: %i[ show edit update destroy ]

  # User doesn't need to be logged in to view listings index and show
  before_action :authenticate_user!, except: %i[ index filter show ]

  # User has to be the owner of the listing to edit/update/destroy
  before_action :authorize_user, only: %i[ edit update destroy ]
  before_action :set_form_vars, only: %i[ new edit ]
  before_action :set_variant, only: %i[ new create ]
  before_action :set_make, only: %i[ index filter ]

  def index
    # Eager loads images, users, and states (not including variants since not accessing anything from that table).    
    # Only does one query, if params :sort exists, otherwise defaults to the else query. This could be refactored.
    if params[:sort]
      @listings = Listing.sorted(params[:sort].to_i).where(sold: false).includes(pictures_attachments: :blob).includes(:state).includes(:user)
    else 
      # Search method, invokes self.search method in Listing Model
      @listings = Listing.search(params[:query], params[:option]).where(sold: false).includes(pictures_attachments: :blob).includes(:state).includes(:user)   
    end
  end

  def filter
    @listings = Listing.filter(params[:make_id])
    render 'index'
  end

  def show 
  end

  def new
    @listing = Listing.new
  end

  # Converts the price from cents back to dollars when the form renders.
  def edit
    @listing.price /= 100
  end

  def create
    @listing = current_user.listings.new(listing_params)
    # 10% deposit => price / 10 and * 100 to convert to cents = * 10. 
    # This is before validation and price is still in dollars so still need to convert to cents
    @listing.update(deposit: @listing.price * 10, variant_id: @variant.id, title: @variant.name)

    respond_to do |format|
      if @listing.save
    
        format.html { redirect_to @listing, notice: 'Listing was successfully created.' }
        format.json { render :show, status: :created, location: @listing }
      else
        set_form_vars
        set_variant
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @listing.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @listing.update(listing_params)
        format.html { redirect_to @listing, notice: 'Listing was successfully updated.' }
        format.json { render :show, status: :ok, location: @listing }
      else
        set_form_vars
        set_variant
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @listing.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @listing.destroy
    respond_to do |format|
      format.html { redirect_to listings_url, notice: 'Listing was successfully deleted.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_listing
    @listing = Listing.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def listing_params
    params.require(:listing).permit(:id, :user_id, :variant_id, :title, :price, :mileage, :description, :state_id, :sold, :postcode, pictures: [], feature_ids: [])
  end

  def filter_params
    params.require(:filter).permit(:make_id)
  end

  def authorize_user
    if current_user.id != @listing.user.id
      flash[:error] = 'Unauthorized Request!'
      redirect_to listings_path
    end
  end

  def set_form_vars
    @features = Feature.all
  end

  def set_variant
    @variant = Variant.last
  end

  def set_make
    @make = Make.all
  end
end
