# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_10_30_073750) do

  create_table "active_storage_attachments", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "attachments", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "uuid"
    t.string "qrcord"
    t.string "zip_url"
    t.string "short_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "car_brands", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "abbr"
    t.string "name"
    t.string "logo"
  end

  create_table "car_configs", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
  end

  create_table "car_details", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "item_id"
    t.integer "config_id"
    t.integer "key"
    t.string "value", limit: 1000
  end

  create_table "car_firm", id: false, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "abbr"
    t.string "brand_name"
    t.string "serie_name"
  end

  create_table "car_items", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "serie_id"
    t.integer "code"
    t.string "name"
    t.string "url"
    t.boolean "is_sale"
    t.boolean "is_truck"
    t.index ["code"], name: "index_car_items_on_code"
    t.index ["serie_id"], name: "index_car_items_on_serie_id"
  end

  create_table "car_pictures", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "item_id"
    t.string "name"
    t.string "url"
    t.string "imgpath"
    t.integer "config_id"
    t.index ["item_id"], name: "index_car_pictures_on_item_id"
  end

  create_table "car_series", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "brand_id"
    t.string "name"
    t.string "url"
    t.string "code"
    t.index ["brand_id"], name: "index_car_series_on_brand_id"
  end

  create_table "cg_gonggaos", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "kind"
    t.string "title"
    t.datetime "date_at"
    t.string "buyer"
    t.string "agent"
    t.string "category"
    t.string "area"
    t.text "desc"
    t.string "url"
    t.integer "key_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "cg_gonggaos_kinds", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "kind_id"
    t.integer "gonggao_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["gonggao_id"], name: "index_cg_gonggaos_kinds_on_gonggao_id"
    t.index ["kind_id"], name: "index_cg_gonggaos_kinds_on_kind_id"
  end

  create_table "cg_keys", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.string "remark"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "cg_kinds", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "is_show", default: false
  end

  create_table "changshang", id: false, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "abbr"
    t.string "brand_name"
    t.string "serie_name"
  end

  create_table "che300_infos", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.text "remark"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "cn_companies", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.string "code"
    t.string "registrationDay"
    t.string "character"
    t.string "legalRepresentative"
    t.string "capital"
    t.text "businessScope"
    t.string "province"
    t.string "city"
    t.string "address"
    t.integer "used"
    t.index ["used"], name: "index_cn_companies_on_used"
  end

  create_table "core_areas", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "code"
    t.string "name"
    t.string "city_code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["city_code"], name: "index_core_areas_on_city_code"
  end

  create_table "core_cities", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "code"
    t.string "name"
    t.string "province_code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["province_code"], name: "index_core_cities_on_province_code"
  end

  create_table "core_provinces", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "code"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "core_streets", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "code"
    t.string "name"
    t.string "area_code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["area_code"], name: "index_core_streets_on_area_code"
  end

  create_table "core_villages", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "code"
    t.string "name"
    t.string "street_code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["street_code"], name: "index_core_villages_on_street_code"
  end

  create_table "dc_photos", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "user_id"
    t.string "url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "dc_users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "uid"
    t.integer "photo_num"
    t.string "photo_hash"
    t.integer "sign", default: 1
    t.string "info"
    t.integer "checked", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "has_photo"
    t.index ["uid"], name: "index_dc_users_on_uid"
  end

  create_table "hz_banks", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "cn_date_year"
    t.string "cn_date_month"
    t.string "cn_date_day"
    t.string "company"
    t.string "card_number_1"
    t.string "bank"
    t.string "xingming"
    t.string "card_number_2"
    t.string "bank_branch"
    t.string "cn_money"
    t.string "en_money"
    t.string "cn_date"
    t.string "protocol_number"
    t.string "bank_number"
    t.string "address"
    t.string "xingming_2"
    t.string "en_date_year"
    t.string "en_date_month"
    t.string "en_date_day"
    t.string "phone"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "hz_idcards", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.string "sex"
    t.string "nation"
    t.date "birthday"
    t.string "street"
    t.string "number"
    t.string "org"
    t.date "start_at"
    t.date "end_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "jz_records", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "user_id"
    t.datetime "enter_at"
    t.boolean "is_first"
    t.integer "computer_num"
    t.string "remark"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "jz_sxes", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "user_id"
    t.string "name"
    t.datetime "start_at"
    t.datetime "end_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "jz_users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "code"
    t.string "name"
    t.string "phone"
    t.string "alipay"
    t.integer "rate"
    t.string "remark"
    t.integer "this_month_num"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "id_card"
  end

  create_table "monitor_gpus", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "server_id"
    t.integer "free_num"
    t.string "info"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["server_id"], name: "index_monitor_gpus_on_server_id"
  end

  create_table "monitor_infos", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "server_id"
    t.text "info"
    t.string "remark"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["server_id"], name: "index_monitor_infos_on_server_id"
  end

  create_table "monitor_servers", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.string "ip"
    t.string "remark"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "qx_airports", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "city_name"
    t.string "airport_3_code"
    t.string "city_ch_ame"
    t.string "country_name"
    t.string "airport_4_code"
    t.string "airport_name"
    t.string "english_name"
    t.float "longgitude"
    t.float "latitude"
    t.datetime "created_at", null: false
  end

  create_table "qx_infos", options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.string "name"
    t.datetime "up_at"
    t.datetime "down_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "qx_landings", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "airport_id"
    t.string "runway"
    t.string "come_near_type"
    t.string "come_near_normal"
    t.string "c_kind"
    t.datetime "created_at", null: false
    t.integer "runway_id"
  end

  create_table "qx_messages", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "airport_id"
    t.string "content"
    t.datetime "hour_tag"
    t.string "value"
    t.datetime "created_at", null: false
    t.integer "state"
  end

  create_table "qx_runways", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "airport_id"
    t.string "name"
    t.datetime "created_at", null: false
  end

  create_table "qx_take_offs", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "airport_id"
    t.string "runway"
    t.string "aircraft_type"
    t.string "hirl_rcls"
    t.string "hirl"
    t.string "hirl_rcls_stop"
    t.string "lights"
    t.datetime "created_at", null: false
    t.integer "runway_id"
  end

  create_table "qx_weathers", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "airport_id"
    t.datetime "hour_tag"
    t.integer "value"
    t.string "content"
    t.integer "state"
    t.datetime "created_at", null: false
  end

  create_table "truck_brands", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "abbr"
    t.string "name"
    t.string "logo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "truck_configs", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "truck_details", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "item_id"
    t.integer "config_id"
    t.string "value", limit: 1000
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "truck_items", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "serie_id"
    t.integer "code"
    t.string "name"
    t.string "url"
    t.integer "is_sale"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "truck_pictures", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "item_id"
    t.string "name"
    t.string "url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "truck_series", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "brand_id"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tuhu_brands", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.string "logo"
    t.string "abbr"
    t.string "reamrk"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tuhu_details", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "version_id"
    t.string "url"
    t.string "remark"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "state", default: 0
    t.index ["state"], name: "index_tuhu_details_on_state"
  end

  create_table "tuhu_prodocts", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "detail_id"
    t.integer "kind_id"
    t.string "name"
    t.string "price"
    t.string "category"
    t.string "url"
    t.string "remark"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tuhu_product_details", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "product_id"
    t.integer "detail_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["detail_id"], name: "index_tuhu_product_details_on_detail_id"
    t.index ["product_id"], name: "index_tuhu_product_details_on_product_id"
  end

  create_table "tuhu_products", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "kind_id"
    t.string "img"
    t.string "name"
    t.string "price"
    t.string "category"
    t.string "url"
    t.string "remark"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_tuhu_products_on_name"
  end

  create_table "tuhu_versions", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "brand_id"
    t.string "name"
    t.string "abbr"
    t.string "reamrk"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["brand_id"], name: "index_tuhu_versions_on_brand_id"
  end

  create_table "tyc_categories", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tyc_cids", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "city_id"
    t.integer "state"
    t.string "number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tyc_cities", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tyc_companies", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "code"
    t.string "logo"
    t.string "name"
    t.string "old_name"
    t.string "phone"
    t.string "mail"
    t.string "url"
    t.string "address"
    t.text "intro"
    t.date "update_date"
    t.string "boss_name"
    t.string "reg_money"
    t.string "set_date"
    t.string "status"
    t.string "reg_number"
    t.string "credit_code"
    t.string "company_code"
    t.string "tax_code"
    t.integer "category_id"
    t.string "end_time"
    t.integer "industry_id"
    t.string "tax"
    t.string "allow_time"
    t.string "pay_money"
    t.string "all_people"
    t.string "insured_people"
    t.string "organ"
    t.string "reg_address"
    t.string "en_name"
    t.text "operate_scope"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "city_id"
    t.integer "used", default: 0
    t.index ["used"], name: "index_tyc_companies_on_used"
  end

  create_table "tyc_gudongs", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "company_id"
    t.integer "human_id"
    t.string "invest_rate"
    t.string "invest_amount"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tyc_humen", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "company_id"
    t.string "name"
    t.string "code"
    t.string "job"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tyc_industries", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tyc_investe_abroads", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "company_id"
    t.integer "abroadd_company_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "uids", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "number"
    t.string "remark"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
