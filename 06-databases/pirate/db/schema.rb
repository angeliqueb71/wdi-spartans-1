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

ActiveRecord::Schema.define(version: 20170419181049) do

  create_table "letters", force: :cascade do |t|
    t.string  "title"
    t.text    "content"
    t.integer "pirate_id"
  end

  create_table "pirate_ships", force: :cascade do |t|
    t.integer "pirate_id"
    t.integer "ship_id"
  end

  create_table "pirates", force: :cascade do |t|
    t.string   "name"
    t.datetime "bday"
    t.string   "password"
  end

  create_table "ships", force: :cascade do |t|
    t.string "name"
  end

end
