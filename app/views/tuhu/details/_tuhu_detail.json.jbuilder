json.extract! tuhu_detail, :id, :version_id, :url, :remark, :created_at, :updated_at
json.url tuhu_detail_url(tuhu_detail, format: :json)
