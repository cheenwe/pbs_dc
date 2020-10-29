class CreateQxDb < ActiveRecord::Migration[5.2]
  def change
  	
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

  end
end
