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

ActiveRecord::Schema.define(version: 20190701022134) do

  create_table "items", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name", null: false
    t.text "description", null: false
    t.string "item_status", null: false
    t.integer "delivery_fee", null: false
    t.string "delivery_method", null: false
    t.integer "delivery_date", null: false
    t.integer "prefecture", null: false
    t.integer "price", null: false
    t.string "size"
    t.integer "transaction_status", default: 0, null: false
    t.integer "seller_id", null: false
    t.integer "buyer_id", null: false
    t.integer "category_id", null: false
    t.integer "brand_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_items_on_name"
    t.index ["price"], name: "index_items_on_price"
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
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

end
