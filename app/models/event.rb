class Event < ApplicationRecord
  extend SimpleCalendar
  # has_calendar :attribute => :start_time
  belongs_to :listing
end
