module ListingsHelper
  def image_select(listing)
    return listing.pictures[0] if listing.pictures.attached?
    return 'default-image.png' # use default image if no picture attached
  end

  def deposit_paid(listing)
    puts "\n\n\n\n\n\n ######## listing in deposit_paid in helper is:\n"
    pp listing
    puts "\n\n\n"
    !listing.purchases.find_by(buyer_id: current_user&.id).nil?
  end

  # Selects events from Events, where the buyer id matches the current user's id.,
  # and returns the event ids.
  def find_event
    Event.joins(:purchase).where(purchase: {buyer_id: current_user.id}).ids
  end
end
