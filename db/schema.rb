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

ActiveRecord::Schema.define(version: 20170304224054) do

  create_table "availabilities", force: :cascade do |t|
    t.string   "timeslot"
    t.integer  "pwd_id"
    t.integer  "volunteer_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "cultural_backgrounds", force: :cascade do |t|
    t.string   "background"
    t.integer  "volunteer_id"
    t.integer  "pwd_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "hobbies", force: :cascade do |t|
    t.string   "name"
    t.integer  "pwd_id"
    t.integer  "volunteer_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "interactions", force: :cascade do |t|
    t.integer  "volunteer_id"
    t.integer  "pwd_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.string   "interaction"
  end

  create_table "languages", force: :cascade do |t|
    t.string   "language"
    t.integer  "pwd_id"
    t.integer  "volunteer_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "matches", force: :cascade do |t|
    t.integer  "volunteer_id"
    t.integer  "pwd_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "organizations", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "phone_number"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.string   "full_address"
  end

  create_table "pwds", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.integer  "age"
    t.boolean  "active"
    t.string   "neighborhood"
    t.string   "city"
    t.string   "password_digest"
    t.integer  "organization_id", default: 1
  end

  create_table "schoolings", force: :cascade do |t|
    t.string   "name"
    t.integer  "pwd_id"
    t.integer  "volunteer_id"
    t.string   "level"
    t.string   "specialization"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "skills", force: :cascade do |t|
    t.string   "name"
    t.integer  "pwd_id"
    t.integer  "volunteer_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "volunteers", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "neighborhood"
    t.string   "city"
    t.string   "password_digest"
  end

  create_table "work_experiences", force: :cascade do |t|
    t.string   "industry"
    t.integer  "pwd_id"
    t.integer  "volunteer_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

end
