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

ActiveRecord::Schema.define(version: 20141218174839) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "accolades", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "active_admin_comments", force: true do |t|
    t.string   "namespace"
    t.text     "body"
    t.string   "resource_id",   null: false
    t.string   "resource_type", null: false
    t.integer  "author_id"
    t.string   "author_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id", using: :btree
  add_index "active_admin_comments", ["namespace"], name: "index_active_admin_comments_on_namespace", using: :btree
  add_index "active_admin_comments", ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id", using: :btree

  create_table "awardings", force: true do |t|
    t.integer  "restaurant_id"
    t.integer  "accolade_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "bookings", force: true do |t|
    t.integer  "user_id"
    t.integer  "number_of_tickets"
    t.integer  "event_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "cities", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "contacts", force: true do |t|
    t.string   "name"
    t.string   "title"
    t.string   "email"
    t.string   "phone_number"
    t.boolean  "is_primary"
    t.integer  "restaurant_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "dining_options", force: true do |t|
    t.integer  "restaurant_id"
    t.integer  "experience_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "earnings", force: true do |t|
    t.integer  "user_id"
    t.integer  "tastepoint_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "events", force: true do |t|
    t.date     "date"
    t.integer  "number_of_seats"
    t.integer  "restaurant_id"
    t.decimal  "seat_cost"
    t.integer  "max_tickets_per_member"
    t.string   "nonmember_code"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "experiences", force: true do |t|
    t.string   "type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "inqueries", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "referral_source"
    t.string   "zipcode"
    t.date     "invite_sent_date"
    t.string   "referral_code"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "menu_items", force: true do |t|
    t.integer  "menu_id"
    t.integer  "course_number"
    t.string   "name"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "menus", force: true do |t|
    t.integer  "event_id"
    t.integer  "number_of_courses"
    t.string   "name"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "promo_codes", force: true do |t|
    t.string   "code"
    t.date     "expiration_date"
    t.decimal  "membership_price"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "referrals", force: true do |t|
    t.integer  "user_id"
    t.string   "type"
    t.string   "name_of_referred"
    t.string   "email_of_referred"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "restaurants", force: true do |t|
    t.string   "name"
    t.string   "address"
    t.integer  "city_id"
    t.string   "neighborhood"
    t.string   "cuisine_type"
    t.string   "description"
    t.decimal  "gratuity",     precision: 3, scale: 2
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tastepoints", force: true do |t|
    t.integer  "amount"
    t.string   "earned_by"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "password"
    t.string   "address"
    t.string   "zipcode"
    t.string   "phone_number"
    t.decimal  "dining_credit"
    t.integer  "taste_points"
    t.string   "referral_code"
    t.integer  "membership_cost"
    t.boolean  "is_admin?"
    t.boolean  "is_active?"
    t.datetime "last_login"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
