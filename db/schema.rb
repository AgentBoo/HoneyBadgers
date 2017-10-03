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
#git change 
ActiveRecord::Schema.define(version: 20171003141755) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "badges", force: :cascade do |t|
    t.string "product"
    t.string "sku"
    t.decimal "price", precision: 10, scale: 4
    t.string "size"
    t.integer "quantity"
    t.integer "year"
    t.text "description"
    t.string "category"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "featured", default: false
    t.boolean "available", default: true
  end

  create_table "cart_items", force: :cascade do |t|
    t.bigint "badge_id"
    t.bigint "order_id"
    t.decimal "unit_price", precision: 10, scale: 4
    t.integer "quantity"
    t.decimal "total_price", precision: 10, scale: 4
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["badge_id"], name: "index_cart_items_on_badge_id"
    t.index ["order_id"], name: "index_cart_items_on_order_id"
  end

  create_table "contact_infos", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "address_line_1"
    t.string "address_line_2"
    t.string "city"
    t.string "state_prov_reg"
    t.string "zip"
    t.integer "phone"
    t.text "special_instructions"
    t.bigint "order_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["order_id"], name: "index_contact_infos_on_order_id"
  end

  create_table "order_statuses", force: :cascade do |t|
    t.string "phase"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "orders", force: :cascade do |t|
    t.integer "items_count"
    t.decimal "subtotal", precision: 10, scale: 4
    t.decimal "shipping_handling", precision: 10, scale: 4
    t.decimal "tax", precision: 10, scale: 4
    t.decimal "total", precision: 10, scale: 4
    t.bigint "order_status_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["order_status_id"], name: "index_orders_on_order_status_id"
  end

  add_foreign_key "cart_items", "badges"
  add_foreign_key "cart_items", "orders"
  add_foreign_key "contact_infos", "orders"
  add_foreign_key "orders", "order_statuses"
end
