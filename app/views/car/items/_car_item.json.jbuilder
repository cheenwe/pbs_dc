json.extract! car_item, :id, :serie_id, :code, :name, :url, :is_sale, :created_at, :updated_at
json.url car_item_url(car_item, format: :json)
