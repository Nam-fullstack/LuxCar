module ProfilesHelper
  def has_event
    # Checks to see if the user has events based on purchased cars or has cars sold (deposits paid),
    # which references Purchase table by buyer_id and seller_id, respectively.
    !current_user&.bought_cars.joins(:event).empty? || !current_user&.sold_cars.joins(:event).empty?
  end
end
