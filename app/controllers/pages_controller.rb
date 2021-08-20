class PagesController < ApplicationController
  before_action :authenticate_user!, except: %i[ index show ]
  
  def home
  end

  def restricted
  end
end
