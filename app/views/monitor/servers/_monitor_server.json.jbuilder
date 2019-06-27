json.extract! monitor_server, :id, :name, :ip, :remark, :created_at, :updated_at
json.url monitor_server_url(monitor_server, format: :json)
