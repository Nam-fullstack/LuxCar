json.extract! event, :id, :listing_id, :location_id, :name, :start_time, :message, :confirmed, :created_at, :updated_at
json.url event_url(event, format: :json)
