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

ActiveRecord::Schema[7.0].define(version: 2023_02_16_075122) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "accounts", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_accounts_on_user_id"
  end

  create_table "properties", force: :cascade do |t|
    t.string "name"
    t.string "location"
    t.string "property_type"
    t.string "category"
    t.integer "no_units"
    t.string "tenant_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "account_id", null: false
    t.index ["account_id"], name: "index_properties_on_account_id"
  end

  create_table "tenants", force: :cascade do |t|
    t.string "firstname"
    t.string "email"
    t.string "tenant_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "lastname"
    t.integer "phone"
    t.string "password_digest"
    t.integer "account_id"
    t.date "date_of_lease"
    t.integer "rent_amount"
    t.integer "deposit"
    t.date "rent_due"
    t.string "lease_term"
    t.date "end_date_of_lease"
    t.integer "unit_id"
    t.bigint "property_id", null: false
    t.index ["account_id"], name: "index_tenants_on_account_id"
    t.index ["property_id"], name: "index_tenants_on_property_id"
  end

  create_table "tickets", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.string "tenant_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "units", force: :cascade do |t|
    t.string "name"
    t.integer "bedrooms"
    t.integer "bathrooms"
    t.integer "rent"
    t.integer "tenant_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "property_id", null: false
    t.string "status", default: "available"
    t.index ["property_id"], name: "index_units_on_property_id"
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
    t.string "firstname"
    t.string "lastname"
    t.boolean "admin"
    t.string "invitation_token"
    t.datetime "invitation_created_at"
    t.datetime "invitation_sent_at"
    t.datetime "invitation_accepted_at"
    t.integer "invitation_limit"
    t.integer "invited_by_id"
    t.string "invited_by_type"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["invitation_token"], name: "index_users_on_invitation_token", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "accounts", "users"
  add_foreign_key "properties", "accounts"
  add_foreign_key "tenants", "properties"
  add_foreign_key "units", "properties"
end
