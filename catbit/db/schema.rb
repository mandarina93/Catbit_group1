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

ActiveRecord::Schema.define(version: 20150303013714) do

  create_table "goals", force: :cascade do |t|
    t.string   "goalName"
    t.integer  "goalAmount"
    t.integer  "profile_id"
    t.integer  "time_frame_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "profiles", force: :cascade do |t|
    t.string   "userName"
    t.integer  "userAge"
    t.string   "userGender"
    t.integer  "userHeight"
    t.integer  "userWeight"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "steps", force: :cascade do |t|
    t.datetime "stepDate"
    t.integer  "stepAmount"
    t.integer  "profile_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "themes", force: :cascade do |t|
    t.integer  "profile_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "time_frames", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "password_digest"
  end

end
