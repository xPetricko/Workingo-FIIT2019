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

ActiveRecord::Schema.define(version: 2019_03_30_153512) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "accepted_offers", id: :integer, default: nil, force: :cascade do |t|
    t.string "label"
    t.integer "user_id", null: false
    t.integer "offer_id"
    t.date "accepted_at"
  end

  create_table "adresses", id: :integer, default: nil, force: :cascade do |t|
    t.integer "state_id"
    t.integer "city_id"
    t.integer "street_id"
    t.integer "house_number"
  end

  create_table "categories", id: :integer, default: nil, force: :cascade do |t|
    t.string "label"
  end

  create_table "cities", id: :integer, default: nil, force: :cascade do |t|
    t.integer "postal_code"
    t.string "name"
    t.integer "state_id"
  end

  create_table "offers", id: :integer, default: nil, force: :cascade do |t|
    t.string "label"
    t.text "description"
    t.integer "owner_id", null: false
    t.integer "kategory_id"
    t.boolean "active"
    t.date "start_date"
    t.date "end_date"
    t.integer "adress_id"
    t.float "wage_per_hour"
  end

  create_table "rating_history", id: false, force: :cascade do |t|
    t.integer "id"
    t.date "rated_at"
    t.integer "stars_count"
    t.integer "rated_user"
    t.integer "rated_by"
  end

  create_table "states", id: :integer, default: nil, force: :cascade do |t|
    t.string "name"
  end

  create_table "streets", id: :integer, default: nil, force: :cascade do |t|
    t.string "name"
    t.integer "city_id"
  end

  create_table "users", id: :integer, default: nil, force: :cascade do |t|
    t.string "full_name"
    t.string "email"
    t.string "gender"
    t.string "date_of_birth"
    t.string "created_at"
    t.text "password_digest"
    t.index ["email"], name: "users_email_key", unique: true
  end

  add_foreign_key "accepted_offers", "offers", name: "accepted_offers_offer_id_fkey"
  add_foreign_key "accepted_offers", "users", name: "accepted_offers_user_id_fkey"
  add_foreign_key "adresses", "cities", name: "adresses_city_id_fkey"
  add_foreign_key "adresses", "states", name: "adresses_state_id_fkey"
  add_foreign_key "adresses", "streets", name: "adresses_street_id_fkey"
  add_foreign_key "cities", "states", name: "cities_state_id_fkey"
  add_foreign_key "offers", "adresses", name: "offers_adress_id_fkey"
  add_foreign_key "offers", "categories", column: "kategory_id", name: "offers_kategory_id_fkey"
  add_foreign_key "offers", "users", column: "owner_id", name: "offers_owner_id_fkey"
  add_foreign_key "rating_history", "users", column: "rated_by", name: "rating_history_rated_by_fkey"
  add_foreign_key "rating_history", "users", column: "rated_user", name: "rating_history_rated_user_fkey"
  add_foreign_key "streets", "cities", name: "streets_city_id_fkey"
end
