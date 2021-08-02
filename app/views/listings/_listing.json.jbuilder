json.extract! listing, :id, :user_id, :variant_id, :colour_id, :title, :price, :mileage, :description, :state_id, :sold, :created_at, :updated_at
json.url listing_url(listing, format: :json)
