json.extract! tuhu_product, :id, :kind_id, :img, :name, :price, :category, :url, :remark, :created_at, :updated_at
json.url tuhu_product_url(tuhu_product, format: :json)
