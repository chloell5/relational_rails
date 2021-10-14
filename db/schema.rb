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

ActiveRecord::Schema.define(version: 2021_10_14_182625) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "activities", force: :cascade do |t|
    t.string "name"
    t.string "day"
    t.time "time"
    t.integer "max_number"
    t.boolean "drop_in"
    t.bigint "gym_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["gym_id"], name: "index_activities_on_gym_id"
  end

  create_table "compositions", force: :cascade do |t|
    t.string "name"
    t.string "artist"
    t.boolean "on_display"
    t.integer "year_made"
    t.bigint "museum_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["museum_id"], name: "index_compositions_on_museum_id"
  end

  create_table "gyms", force: :cascade do |t|
    t.string "name"
    t.string "location"
    t.boolean "open"
    t.integer "rank"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "museums", force: :cascade do |t|
    t.string "name"
    t.boolean "free_admission"
    t.integer "donation_revenue"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "activities", "gyms"
  add_foreign_key "compositions", "museums"
end
