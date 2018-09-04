json.extract! dc_user, :id, :uid, :photo_num, :photo_hash, :sign, :info, :created_at, :updated_at
json.url dc_user_url(dc_user, format: :json)
