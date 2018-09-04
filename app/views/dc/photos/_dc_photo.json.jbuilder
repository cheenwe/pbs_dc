json.extract! dc_photo, :id, :user_id, :url, :created_at, :updated_at
json.url dc_photo_url(dc_photo, format: :json)
