class PagesController < ApplicationController
  before_action :authenticate_user!, except: %i[ home ]
  before_action :get_makes, only: %i[ home ] 
  
  def home
  end

  def restricted
  end

  def get_makes
    @make = Make.all
  end
end
