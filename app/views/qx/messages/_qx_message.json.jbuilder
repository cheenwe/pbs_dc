json.extract! qx_message, :id, :airport_id, :content, :hour_tag, :value, :created_at, :updated_at
json.url qx_message_url(qx_message, format: :json)
