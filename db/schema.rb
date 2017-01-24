# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20150430044709) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "hstore"

  create_table "customers", force: true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "mobile"
    t.text     "address"
    t.string   "gps_location"
    t.string   "id_pp"
    t.integer  "sex"
    t.boolean  "disabled"
    t.integer  "race"
    t.integer  "number_in_household"
    t.boolean  "terms_agreed"
    t.date     "start_date"
    t.date     "end_date"
    t.text     "end_date_reason"
    t.boolean  "power_pack_paid"
    t.boolean  "lease_stove"
    t.string   "stove_number"
    t.boolean  "installed"
    t.hstore   "fuel_cook"
    t.hstore   "fuel_heat"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
  end

  create_table "orders", force: true do |t|
    t.string   "status"
    t.integer  "product_id"
    t.integer  "customer_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "reference"
  end

  create_table "products", force: true do |t|
    t.string   "name"
    t.decimal  "price"
    t.string   "code"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "fname"
    t.string   "lname"
    t.string   "email"
    t.integer  "mobile"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "password_digest"
    t.text     "address"
    t.string   "id_pp"
    t.string   "sex"
    t.string   "disabled"
    t.string   "race"
    t.string   "agreed"
    t.string   "phone"
    t.string   "fax"
    t.datetime "starts_at"
    t.datetime "ends_at"
    t.integer  "role"
    t.integer  "owner_id"
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
    t.boolean  "status"
  end

end
