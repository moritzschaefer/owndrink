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

ActiveRecord::Schema.define(version: 20150620153113) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "drinks", force: :cascade do |t|
    t.string   "title"
    t.string   "flavor_base"
    t.string   "e_numbers"
    t.boolean  "stevia"
    t.integer  "bottle_type"
    t.string   "alcohol_type"
    t.string   "energy_type"
    t.string   "img_ref"
    t.integer  "blubber"
    t.integer  "required_amount"
    t.float    "price_idea"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "innovator_email"
    t.string   "builder_email"
  end

end
