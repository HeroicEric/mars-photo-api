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

ActiveRecord::Schema.define(version: 20151024040622) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cameras", force: :cascade do |t|
    t.string  "name"
    t.integer "rover_id"
    t.string  "full_name"
  end

  create_table "photos", force: :cascade do |t|
    t.string  "img_src",    null: false
    t.integer "sol",        null: false
    t.string  "old_camera"
    t.date    "earth_date"
    t.integer "rover_id"
    t.integer "camera_id"
  end

  add_index "photos", ["camera_id"], name: "index_photos_on_camera_id", using: :btree
  add_index "photos", ["earth_date"], name: "index_photos_on_earth_date", using: :btree
  add_index "photos", ["img_src"], name: "index_photos_on_img_src", using: :btree
  add_index "photos", ["rover_id"], name: "index_photos_on_rover_id", using: :btree
  add_index "photos", ["sol", "camera_id", "img_src", "rover_id"], name: "index_photos_on_sol_and_camera_id_and_img_src_and_rover_id", unique: true, using: :btree

  create_table "rovers", force: :cascade do |t|
    t.string "name"
    t.date   "landing_date"
  end

end
