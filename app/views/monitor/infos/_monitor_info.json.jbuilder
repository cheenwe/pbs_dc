json.extract! monitor_info, :id, :server_id, :info, :remark, :created_at, :updated_at
json.url monitor_info_url(monitor_info, format: :json)
