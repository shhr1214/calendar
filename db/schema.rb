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

ActiveRecord::Schema.define(version: 3) do

  create_table "events", force: :cascade do |t|
    t.string   "title",       limit: 255,   null: false
    t.datetime "start_time",                null: false
    t.datetime "end_time",                  null: false
    t.text     "description", limit: 65535, null: false
    t.string   "place",       limit: 255,   null: false
    t.integer  "author_id",   limit: 4,     null: false
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "participants", force: :cascade do |t|
    t.integer  "event_id",   limit: 4
    t.integer  "user_id",    limit: 4
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "name",        limit: 255,                        null: false
    t.integer  "employee_id", limit: 4,                          null: false
    t.string   "password",    limit: 255,                        null: false
    t.integer  "auth",        limit: 4,   default: 1,            null: false
    t.date     "entry_date",              default: '2016-01-05', null: false
    t.date     "retire_date",             default: '9999-12-31', null: false
    t.datetime "created_at",                                     null: false
    t.datetime "updated_at",                                     null: false
  end

end
