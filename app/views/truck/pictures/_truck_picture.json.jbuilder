json.extract! truck_picture, :id, :item_id, :name, :url, :created_at, :updated_at
json.url truck_picture_url(truck_picture, format: :json)
