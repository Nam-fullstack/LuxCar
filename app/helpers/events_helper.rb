module EventsHelper
  def events_ajax_previous_link
    ->(param, date_range) { link_to raw("&laquo;"), { param => date_range.first - 1.day }, remote: :true }
  end

  def events_ajax_next_link
    ->(param, date_range) { link_to raw("&raquo;"), { param => date_range.last + 1.day }, remote: :true }
  end

  # Changes status of event to being confirmed true.
  def confirm_event
    @event.update(confirmed: true)
  end

  # Queries purchases where the buyer_id corresponds with the user's id, and then uses that purchase_id
  # to query the Events table to find the relevant event and returns the event id. 
  def event_exists
    @purchase = Purchase.where(buyer_id: current_user.id).last
    @event = Event.find_by(purchase_id: @purchase.id)
    @event.id
  end

  # Checks to see if the current user has made a purchase, and if there are no events based off the
  # purchase id, then it will show a button to create a new event [Schedule Test Drive] in events#index
  # By default, Event.find_by(purchase_id: purchase.id) will evaluate to nil if a user hasn't paid a deposit
  # therefore also need to have purchase evaluate to true as well.
  def no_event
    purchase = Purchase.where(buyer_id: current_user.id).last
    puts "\n\n\n\n\n def no_event - purchase.last the last purchase"
    pp purchase
    if purchase && Event.find_by(purchase_id: purchase.id).nil? 
      return true
    end
  end
end
