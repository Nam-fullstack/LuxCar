module EventsHelper
  def events_ajax_previous_link
    ->(param, date_range) { link_to raw("&laquo;"), { param => date_range.first - 1.day }, remote: :true }
  end

  def events_ajax_next_link
    ->(param, date_range) { link_to raw("&raquo;"), { param => date_range.last + 1.day }, remote: :true }
  end

  def event_exists
    @purchase = Purchase.find_by(buyer_id: current_user.id)
    @event = Event.find_by(purchase_id: @purchase.id)
    @event.id
  end

  # Checks to see if the current user has made a purchase, and if there are no events based off the
  # purchase id, then it will show a button to create a new event [Schedule Test Drive] in events#index
  # By default, Event.find_by(purchase_id: purchase.id) will evaluate to nil if a user hasn't paid a deposit
  # so also need to have purchase evaluate to true as well.
  def no_event
    purchase = Purchase.find_by(buyer_id: current_user.id)
    if purchase && Event.find_by(purchase_id: purchase.id).nil?
      return true
    end
  end
end
