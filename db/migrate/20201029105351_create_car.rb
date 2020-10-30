class CreateCar < ActiveRecord::Migration[5.2]
  def change

    create_table "car_brands", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
      t.string "abbr"
      t.string "name"
      t.string "logo"
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
    end unless table_exists? :car_brands

    create_table "car_configs", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
      t.string "name"
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
    end unless table_exists? :car_configs

    create_table "car_details", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
      t.integer "item_id"
      t.integer "config_id"
      t.integer "key"
      t.string "value"
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
    end  unless table_exists? :car_details

    create_table "car_items", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
      t.integer "serie_id"
      t.integer "code"
      t.string "name"
      t.string "url"
      t.boolean "is_sale"
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
      t.boolean "is_truck"
      t.index ["code"], name: "index_car_items_on_code"
      t.index ["serie_id"], name: "index_car_items_on_serie_id"
    end    unless table_exists? :car_items

    create_table "car_pictures", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
      t.integer "item_id"
      t.string "name"
      t.string "url"
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
      t.string "imgpath"
      t.index ["item_id"], name: "index_car_pictures_on_item_id"
    end  unless table_exists? :car_pictures

    create_table "car_series", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
      t.integer "brand_id"
      t.string "name"
      t.string "url"
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
      t.string "code"
      t.index ["brand_id"], name: "index_car_series_on_brand_id"
    end  unless table_exists? :car_series
  end
end
