json.extract! truck_item, :id, :serie_id, :code, :name, :url, :is_sale, :created_at, :updated_at
json.url truck_item_url(truck_item, format: :json)
