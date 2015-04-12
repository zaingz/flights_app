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

ActiveRecord::Schema.define(version: 20150404061642) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admins", force: :cascade do |t|
    t.string   "name"
    t.string   "password_digest"
    t.boolean  "is_admin"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "tbl_aircrafts", id: false, force: :cascade do |t|
    t.string "airline",       limit: 255, null: false
    t.string "aircraft",      limit: 255, null: false
    t.string "seat",          limit: 255, null: false
    t.string "aircraft_logo", limit: 255
  end

  create_table "tbl_airlines", id: false, force: :cascade do |t|
    t.string "airline_logo", limit: 255
    t.string "airline",      limit: 255
  end

  create_table "tbl_alliances", id: false, force: :cascade do |t|
    t.string "alliance",      limit: 255, null: false
    t.string "airline",       limit: 255, null: false
    t.string "logo_alliance", limit: 255
  end

  create_table "tbl_miles", id: false, force: :cascade do |t|
    t.string "alliance", limit: 255
    t.float  "miles"
    t.float  "zone"
  end

  create_table "tbl_routes", id: false, force: :cascade do |t|
    t.string "airline",     limit: 255
    t.string "start",       limit: 255
    t.string "end",         limit: 255
    t.string "aircraft",    limit: 255
    t.string "origin",      limit: 255
    t.string "destination", limit: 255
    t.float  "zone"
  end

end
