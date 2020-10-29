json.extract! car_picture, :id, :item_id, :name, :url, :created_at, :updated_at
json.url car_picture_url(car_picture, format: :json)
