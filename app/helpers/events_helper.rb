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
end
