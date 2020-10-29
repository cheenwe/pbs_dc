json.extract! qx_weather, :id, :airport_id, :hour_tag, :value, :content, :state, :created_at, :updated_at
json.url qx_weather_url(qx_weather, format: :json)
