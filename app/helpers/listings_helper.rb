module ListingsHelper
  def image_select(listing)
    return listing.pictures[0] if listing.pictures.attached?
    return 'default-image.png' # use default image if no picture attached
  end
end
