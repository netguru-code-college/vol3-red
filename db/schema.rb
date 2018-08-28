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

ActiveRecord::Schema.define(version: 2018_08_28_124618) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "anotifications", force: :cascade do |t|
    t.string "title"
    t.text "body"
    t.date "valid_up_to_date"
    t.bigint "apartment_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["apartment_id"], name: "index_anotifications_on_apartment_id"
  end

  create_table "apartment_users", force: :cascade do |t|
    t.integer "status"
    t.bigint "apartment_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["apartment_id"], name: "index_apartment_users_on_apartment_id"
    t.index ["user_id"], name: "index_apartment_users_on_user_id"
  end

  create_table "apartments", force: :cascade do |t|
    t.integer "apartment_number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "building_id"
    t.index ["building_id"], name: "index_apartments_on_building_id"
  end

  create_table "bnotifications", force: :cascade do |t|
    t.string "title"
    t.text "body"
    t.date "valid_up_to_date"
    t.bigint "building_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["building_id"], name: "index_bnotifications_on_building_id"
  end

  create_table "buildings", force: :cascade do |t|
    t.string "street"
    t.integer "building_number"
    t.string "city"
    t.string "zip_code"
    t.bigint "estate_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["estate_id"], name: "index_buildings_on_estate_id"
  end

  create_table "enotifications", force: :cascade do |t|
    t.string "title"
    t.text "body"
    t.date "valid_up_to_date"
    t.bigint "estate_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["estate_id"], name: "index_enotifications_on_estate_id"
  end

  create_table "estates", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name", null: false
    t.string "surname", null: false
    t.string "thumbnail"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "apartments", "buildings"
end
