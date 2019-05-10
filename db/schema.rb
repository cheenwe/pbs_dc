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

ActiveRecord::Schema.define(version: 2019_04_17_065222) do

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
    t.string "name"
    t.string "link"
    t.string "file"
    t.integer "modelable_id"
    t.string "modelable_type"
    t.integer "user_id"
    t.datetime "created_at"
    t.string "type"
    t.index ["modelable_id", "modelable_type"], name: "index_attachments_on_modelable_id_and_modelable_type"
    t.index ["user_id"], name: "index_attachments_on_user_id"
  end

  create_table "audit_items", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "modelable_type"
    t.bigint "modelable_id"
    t.integer "user_id"
    t.string "username"
    t.integer "state"
    t.string "remark"
    t.string "leavel_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "show", default: false
    t.index ["modelable_type", "modelable_id"], name: "index_audit_items_on_modelable_type_and_modelable_id"
  end

  create_table "auditors", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "audit_id"
    t.bigint "user_id"
    t.integer "level"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "kind", default: 1
    t.index ["audit_id"], name: "index_auditors_on_audit_id"
    t.index ["user_id"], name: "index_auditors_on_user_id"
  end

  create_table "audits", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.text "flow"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "core_areas", primary_key: "code", id: :string, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.string "city_code"
  end

  create_table "core_cities", primary_key: "code", id: :string, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.string "province_code"
  end

  create_table "core_provinces", primary_key: "code", id: :string, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
  end

  create_table "core_streets", primary_key: "code", id: :string, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.string "area_code"
  end

  create_table "core_villages", primary_key: "code", id: :string, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.string "street_code"
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

  create_table "exception_tracks", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "title"
    t.text "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "histories", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "record_type"
    t.bigint "record_id"
    t.bigint "user_id"
    t.string "action", null: false
    t.text "modify"
    t.integer "version", default: 0, null: false
    t.string "remote_ip", default: "0"
    t.datetime "created_at", null: false
    t.index ["record_type", "record_id"], name: "index_histories_on_record_type_and_record_id"
    t.index ["user_id"], name: "index_histories_on_user_id"
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

  create_table "licenses", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "mac"
    t.string "sn"
    t.integer "user_id"
    t.date "start_at"
    t.date "end_at"
    t.string "remote_ip"
    t.string "remark"
    t.text "result"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "uuid", limit: 32
    t.index ["user_id"], name: "index_licenses_on_user_id"
    t.index ["uuid"], name: "index_licenses_on_uuid"
  end

  create_table "logs", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "type"
    t.string "record_type"
    t.bigint "record_id"
    t.bigint "user_id"
    t.string "action", null: false
    t.text "body"
    t.string "remote_ip", default: "0"
    t.datetime "created_at", null: false
    t.index ["record_type", "record_id"], name: "index_logs_on_record_type_and_record_id"
    t.index ["user_id"], name: "index_logs_on_user_id"
  end

  create_table "nodes", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name", null: false
    t.string "summary"
    t.integer "section_id", null: false
    t.integer "sort", default: 0, null: false
    t.integer "topics_count", default: 0, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["section_id"], name: "index_nodes_on_section_id"
    t.index ["sort"], name: "index_nodes_on_sort"
  end

  create_table "page_versions", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "page_id", null: false
    t.integer "version", default: 0, null: false
    t.string "slug", null: false
    t.string "title", null: false
    t.text "desc", null: false
    t.text "body", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["page_id"], name: "index_page_versions_on_page_id"
  end

  create_table "pages", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "node_id", null: false
    t.string "node_name"
    t.string "type"
    t.string "slug"
    t.string "title", null: false
    t.text "body", null: false
    t.boolean "locked", default: false
    t.integer "excellent", default: 0
    t.datetime "replied_at"
    t.integer "replies_count", default: 0, null: false
    t.integer "likes_count", default: 0
    t.integer "mentioned_user_ids"
    t.datetime "deleted_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "team_id"
    t.integer "version", default: 0, null: false
    t.string "change_desc"
    t.index ["deleted_at"], name: "index_pages_on_deleted_at"
    t.index ["excellent"], name: "index_pages_on_excellent"
    t.index ["likes_count"], name: "index_pages_on_likes_count"
    t.index ["node_id"], name: "index_pages_on_node_id"
    t.index ["slug"], name: "index_pages_on_slug", unique: true
    t.index ["team_id"], name: "index_pages_on_team_id"
    t.index ["type"], name: "index_pages_on_type"
    t.index ["user_id"], name: "index_pages_on_user_id"
  end

  create_table "permissions", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name", limit: 30, default: "", null: false
    t.string "string", limit: 30, default: "", null: false
    t.string "actions", default: "", null: false
    t.string "ctrl", default: "", null: false
    t.boolean "manage", default: false, null: false
    t.boolean "own", default: false, null: false
    t.boolean "department", default: false, null: false
    t.boolean "core", default: false, null: false
  end

  create_table "permissions_roles", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "role_id"
    t.integer "permission_id"
    t.index ["permission_id"], name: "index_permissions_roles_on_permission_id"
    t.index ["role_id"], name: "index_permissions_roles_on_role_id"
  end

  create_table "projects", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.string "abbr"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "projects_version_users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "projects_version_id"
    t.integer "user_id"
    t.index ["projects_version_id"], name: "index_projects_version_users_on_projects_version_id"
    t.index ["user_id"], name: "index_projects_version_users_on_user_id"
  end

  create_table "projects_versions", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "code"
    t.integer "project_id"
    t.string "number"
    t.date "release_at"
    t.string "release_note"
    t.string "full_package"
    t.string "increase_package"
    t.string "upgrade_step"
    t.text "remark"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["project_id"], name: "index_projects_versions_on_project_id"
  end

  create_table "replies", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "page_id", null: false
    t.text "body", null: false
    t.integer "state", default: 1, null: false
    t.integer "likes_count", default: 0
    t.integer "mentioned_user_ids"
    t.datetime "deleted_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string "action"
    t.integer "reply_to_id"
    t.index ["deleted_at"], name: "index_replies_on_deleted_at"
    t.index ["page_id"], name: "index_replies_on_page_id"
    t.index ["user_id"], name: "index_replies_on_user_id"
  end

  create_table "roles", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.integer "position"
    t.text "permission"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "permission_ids"
  end

  create_table "sections", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name", null: false
    t.integer "sort", default: 0, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["sort"], name: "index_sections_on_sort"
  end

  create_table "settings", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "var", null: false
    t.text "value"
    t.integer "thing_id"
    t.string "thing_type", limit: 30
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["thing_type", "thing_id", "var"], name: "index_settings_on_thing_type_and_thing_id_and_var", unique: true
  end

  create_table "tickets", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "project_id"
    t.bigint "user_id"
    t.string "name"
    t.string "reason"
    t.string "requirement"
    t.text "remark"
    t.integer "state", default: 0, null: false
    t.integer "audit_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["project_id"], name: "index_tickets_on_project_id"
    t.index ["user_id"], name: "index_tickets_on_user_id"
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

  create_table "user_roles", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "role_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["role_id"], name: "index_user_roles_on_role_id"
    t.index ["user_id"], name: "index_user_roles_on_user_id"
  end

  create_table "users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.integer "failed_attempts", default: 0, null: false
    t.string "unlock_token"
    t.datetime "locked_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "avatar"
    t.string "name"
    t.string "address"
    t.string "job"
    t.string "department"
    t.string "phone"
    t.string "code"
    t.string "province"
    t.string "city"
    t.string "bio"
    t.integer "state", limit: 1, default: 0
    t.integer "user_id"
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["state", "id"], name: "index_users_on_state_and_id"
    t.index ["state"], name: "index_users_on_state"
    t.index ["unlock_token"], name: "index_users_on_unlock_token", unique: true
  end

  create_table "vehicle_applies", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "ownerName"
    t.string "zipCode"
    t.string "zipAddress"
    t.string "phoneNum"
    t.string "fixedNum"
    t.string "agentName"
    t.string "agentPhone"
    t.string "plateType"
    t.string "plateNum"
    t.string "flapper"
    t.string "vehicle"
    t.string "register"
    t.string "checkMark"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
  end

  add_foreign_key "tickets", "projects"
  add_foreign_key "tickets", "users"
end
