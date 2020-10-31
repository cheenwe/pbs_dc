json.extract! mm_photo, :id, :album_id, :name, :url, :kind, :created_at, :updated_at
json.url mm_photo_url(mm_photo, format: :json)
