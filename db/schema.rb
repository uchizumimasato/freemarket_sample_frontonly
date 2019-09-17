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

ActiveRecord::Schema.define(version: 2019_09_14_125613) do

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

  create_table "brands", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "cards", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "user_id"
    t.string "customer_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "categories", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name", null: false
    t.string "ancestry"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_categories_on_name"
  end

  create_table "items", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name", null: false
    t.text "description", null: false
    t.integer "item_status", null: false
    t.integer "delivery_fee", null: false
    t.integer "delivery_method_id", null: false
    t.integer "delivery_date", null: false
    t.integer "prefecture_id", null: false
    t.integer "price", null: false
    t.string "size"
    t.integer "transaction_status", default: 0, null: false
    t.integer "seller_id", null: false
    t.integer "buyer_id"
    t.integer "category_id", null: false
    t.integer "brand_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_items_on_name"
    t.index ["price"], name: "index_items_on_price"
  end

  create_table "users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name", null: false
    t.string "name_kana", null: false
    t.string "email", null: false
    t.string "password_digest", null: false
    t.text "profile"
    t.integer "evalation"
    t.datetime "birthday"
    t.string "postal_code"
    t.string "prefecture"
    t.string "city"
    t.string "address"
    t.string "buildint_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "nickname"
    t.index ["name"], name: "index_users_on_name"
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
end
