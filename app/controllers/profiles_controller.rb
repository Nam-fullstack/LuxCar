class ProfilesController < ApplicationController
  before_action :set_profile, only: %i[ show edit update destroy ]
  before_action :authenticate_user!
  before_action :authorize_user, only: %i[ edit destroy ]

  def show
    if current_user.profile.id == params[:id].to_i
      render 'profile_page' # shows the current user's profile
    else
      render 'show' # if not the current user
    end
  end

  def new
    @profile = Profile.new
  end

  def edit
  end

  def create
    @profile = current_user.profile.new(profile_params)

    respond_to do |format|
      if @profile.save
        format.html { redirect_to edit_profile_path, notice: "Profile was successfully created." }
        format.json { render :show, status: :created, location: @profile }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @profile.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|

      # If the profile isn't edited/changed, redirects back to profile page
      if !params[:profile]
        redirect_to profile_path(@profile.id)
        return
      end

      if @profile.update(profile_params)
        format.html { redirect_to @profile, notice: "Profile was successfully updated." }
        format.json { render :show, status: :ok, location: @profile }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @profile.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @profile.destroy
    respond_to do |format|
      format.html { redirect_to profiles_url, notice: "Profile was successfully deleted." }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_profile
    @profile = Profile.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def profile_params
    params.require(:profile).permit(:user_id, :image)
  end

  def authorize_user
    if current_user.id != @profile.user.id
      flash[:alert] = "You are not authorized to view this."
      redirect_to root_url
    end
  end
end
