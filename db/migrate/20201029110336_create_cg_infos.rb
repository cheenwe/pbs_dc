class CreateCgInfos < ActiveRecord::Migration[5.2]
  def change

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
  end
end
