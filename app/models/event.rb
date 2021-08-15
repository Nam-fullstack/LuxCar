class Event < ApplicationRecord
  belongs_to :listing, dependent: :destroy

  extend SimpleCalendar
  # has_calendar :attribute => :start_time
end
