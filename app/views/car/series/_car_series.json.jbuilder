json.extract! car_series, :id, :brand_id, :name, :url, :created_at, :updated_at
json.url car_series_url(car_series, format: :json)
