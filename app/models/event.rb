class Event < ApplicationRecord
  belongs_to :listing

  extend SimpleCalendar
  # has_calendar :attribute => :start_time
end
