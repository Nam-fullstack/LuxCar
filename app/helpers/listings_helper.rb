module ListingsHelper
  def image_select(listing)
    return listing.picture if listing.picture.attached?
    return "default-image.jpg" # use default image if no picture attached
  end
end
