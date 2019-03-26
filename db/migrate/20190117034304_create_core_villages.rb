class CreateCoreVillages < ActiveRecord::Migration[5.2]
  def change

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
  end
end
