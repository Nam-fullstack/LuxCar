# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_07_28_112744) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "body_types", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "engines", force: :cascade do |t|
    t.string "type"
    t.decimal "displacement", precision: 10, scale: 1
    t.integer "power"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "events", force: :cascade do |t|
    t.date "date"
    t.time "time"
    t.bigint "location_id"
    t.text "message"
    t.boolean "confirmed"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "buyer_id"
    t.bigint "seller_id"
    t.index ["buyer_id"], name: "index_events_on_buyer_id"
    t.index ["location_id"], name: "index_events_on_location_id"
    t.index ["seller_id"], name: "index_events_on_seller_id"
  end

  create_table "fuels", force: :cascade do |t|
    t.string "type"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "invoices", force: :cascade do |t|
    t.bigint "listing_id", null: false
    t.boolean "status"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "buyer_id"
    t.bigint "seller_id"
    t.index ["buyer_id"], name: "index_invoices_on_buyer_id"
    t.index ["listing_id"], name: "index_invoices_on_listing_id"
    t.index ["seller_id"], name: "index_invoices_on_seller_id"
  end

  create_table "listings", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "make_id", null: false
    t.bigint "model_id", null: false
    t.integer "price"
    t.integer "mileage"
    t.string "title"
    t.text "description"
    t.boolean "sold"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["make_id"], name: "index_listings_on_make_id"
    t.index ["model_id"], name: "index_listings_on_model_id"
    t.index ["user_id"], name: "index_listings_on_user_id"
  end

  create_table "locations", force: :cascade do |t|
    t.string "address"
    t.string "city"
    t.string "state"
    t.integer "postcode"
    t.float "longitude"
    t.float "latitude"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "makes", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "models", force: :cascade do |t|
    t.string "name"
    t.bigint "make_id", null: false
    t.bigint "variant_id", null: false
    t.bigint "year_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["make_id"], name: "index_models_on_make_id"
    t.index ["variant_id"], name: "index_models_on_variant_id"
    t.index ["year_id"], name: "index_models_on_year_id"
  end

  create_table "purchases", force: :cascade do |t|
    t.bigint "invoice_id", null: false
    t.bigint "listing_id", null: false
    t.string "payment_intent"
    t.string "receipt_url"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["invoice_id"], name: "index_purchases_on_invoice_id"
    t.index ["listing_id"], name: "index_purchases_on_listing_id"
  end

  create_table "transmissions", force: :cascade do |t|
    t.string "type"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "last_sign_in_at"
    t.integer "failed_attempts", default: 0, null: false
    t.string "unlock_token"
    t.datetime "locked_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "username"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "variants", force: :cascade do |t|
    t.string "name"
    t.bigint "engine_id", null: false
    t.bigint "transmission_id", null: false
    t.bigint "fuel_id", null: false
    t.bigint "body_type_id", null: false
    t.integer "weight"
    t.integer "width"
    t.integer "length"
    t.integer "height"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["body_type_id"], name: "index_variants_on_body_type_id"
    t.index ["engine_id"], name: "index_variants_on_engine_id"
    t.index ["fuel_id"], name: "index_variants_on_fuel_id"
    t.index ["transmission_id"], name: "index_variants_on_transmission_id"
  end

  create_table "years", force: :cascade do |t|
    t.integer "year"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "events", "locations"
  add_foreign_key "events", "users", column: "buyer_id"
  add_foreign_key "events", "users", column: "seller_id"
  add_foreign_key "invoices", "listings"
  add_foreign_key "invoices", "users", column: "buyer_id"
  add_foreign_key "invoices", "users", column: "seller_id"
  add_foreign_key "listings", "makes"
  add_foreign_key "listings", "models"
  add_foreign_key "listings", "users"
  add_foreign_key "models", "makes"
  add_foreign_key "models", "variants"
  add_foreign_key "models", "years"
  add_foreign_key "purchases", "invoices"
  add_foreign_key "purchases", "listings"
  add_foreign_key "variants", "body_types"
  add_foreign_key "variants", "engines"
  add_foreign_key "variants", "fuels"
  add_foreign_key "variants", "transmissions"
end
