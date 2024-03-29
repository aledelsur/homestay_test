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

ActiveRecord::Schema.define(version: 20131014085054) do

  create_table "bookings", force: true do |t|
    t.string   "ref"
    t.string   "room_ref"
    t.date     "start_date"
    t.date     "end_date"
    t.integer  "number_of_guests"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "hosts", force: true do |t|
    t.string   "ref"
    t.string   "name"
    t.string   "address"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "room_reservations", force: true do |t|
    t.date     "date"
    t.string   "room_ref"
    t.integer  "disponibility"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "room_reservations", ["room_ref"], name: "index_room_reservations_on_room_ref"

  create_table "rooms", force: true do |t|
    t.string   "ref"
    t.string   "host_ref"
    t.integer  "capacity"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "rooms", ["host_ref"], name: "index_rooms_on_host_ref"

end
