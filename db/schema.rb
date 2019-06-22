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

ActiveRecord::Schema.define(version: 2019_06_22_105644) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "accepted_offers", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "offer_id"
    t.string "contact"
    t.string "name"
    t.index ["offer_id"], name: "index_accepted_offers_on_offer_id"
  end

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["id"], name: "index_categories_on_id"
    t.index ["name"], name: "index_categories_on_name"
  end

  create_table "cities", force: :cascade do |t|
    t.string "postal_code"
    t.string "name"
    t.bigint "state_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "province_id"
    t.index ["name"], name: "index_cities_on_name"
    t.index ["province_id"], name: "index_cities_on_province_id"
    t.index ["state_id"], name: "index_cities_on_state_id"
  end

  create_table "offers", force: :cascade do |t|
    t.text "content"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "category_id"
    t.bigint "state_id"
    t.bigint "city_id"
    t.bigint "province_id"
    t.string "label"
    t.date "date"
    t.boolean "active", default: true
    t.integer "wage"
    t.index ["category_id", "city_id", "state_id"], name: "index_offers_on_category_id_and_city_id_and_state_id"
    t.index ["category_id"], name: "index_offers_on_category_id"
    t.index ["city_id"], name: "index_offers_on_city_id"
    t.index ["date"], name: "index_offers_on_date"
    t.index ["province_id"], name: "index_offers_on_province_id"
    t.index ["state_id"], name: "index_offers_on_state_id"
    t.index ["user_id", "created_at"], name: "index_offers_on_user_id_and_created_at"
    t.index ["user_id"], name: "index_offers_on_user_id"
  end

  create_table "provinces", force: :cascade do |t|
    t.string "code"
    t.string "name"
    t.bigint "state_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_provinces_on_name"
    t.index ["state_id"], name: "index_provinces_on_state_id"
  end

  create_table "states", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "code"
    t.index ["id"], name: "index_states_on_id"
    t.index ["name"], name: "index_states_on_name", unique: true
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "password_digest"
    t.boolean "admin", default: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["name"], name: "index_users_on_name"
  end

  add_foreign_key "accepted_offers", "offers"
  add_foreign_key "cities", "provinces"
  add_foreign_key "cities", "states"
  add_foreign_key "offers", "categories"
  add_foreign_key "offers", "cities"
  add_foreign_key "offers", "provinces"
  add_foreign_key "offers", "states"
  add_foreign_key "offers", "users"
  add_foreign_key "provinces", "states"
end
