class PagesController < ApplicationController
  before_action :authenticate_user!, except: %i[ home ]
  before_action :get_makes, only: %i[ home ] 
  
  def home
  end

  def restricted
  end

  # Gets all the makes so the home page can render the make's logo, which is a link to 
  # filter listings by that particular make.
  def get_makes
    @make = Make.all
  end
end
