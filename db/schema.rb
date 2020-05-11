# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_05_09_115758) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "activities", force: :cascade do |t|
    t.string "title"
    t.string "description"
    t.integer "goal"
    t.string "unit"
    t.bigint "challenge_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["challenge_id"], name: "index_activities_on_challenge_id"
  end

  create_table "challenges", force: :cascade do |t|
    t.string "title"
    t.string "description"
    t.bigint "owner_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["owner_id"], name: "index_challenges_on_owner_id"
  end

  create_table "entries", force: :cascade do |t|
    t.integer "amount"
    t.bigint "activity_id"
    t.bigint "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["activity_id"], name: "index_entries_on_activity_id"
    t.index ["user_id"], name: "index_entries_on_user_id"
  end

  create_table "requests", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "challenge_id"
    t.boolean "confirmed"
    t.bigint "owner_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["challenge_id"], name: "index_requests_on_challenge_id"
    t.index ["owner_id"], name: "index_requests_on_owner_id"
    t.index ["user_id"], name: "index_requests_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "name"
    t.string "password_digest"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "provider"
    t.string "token"
    t.string "secret"
  end

  add_foreign_key "challenges", "users", column: "owner_id"
  add_foreign_key "requests", "users", column: "owner_id"
end
