module ListingsHelper
  def image_select(listing)
    return listing.picture if listing.picture.attached?
    return 'default-image.png' # use default image if no picture attached
  end
end
