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

ActiveRecord::Schema.define(version: 20140725152916) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "subscription_events", force: true do |t|
    t.integer "user_id",                              null: false
    t.string  "event_type",                           null: false
    t.date    "date",                                 null: false
    t.integer "price_per_month_in_cents", default: 0, null: false
  end

  create_table "users", force: true do |t|
    t.string  "name",                            null: false
    t.string  "email",                           null: false
    t.string  "password_digest",                 null: false
    t.boolean "admin",           default: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree

end
