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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 3) do

  create_table "districts", :force => true do |t|
    t.integer  "state_id"
    t.integer  "division_id"
    t.string   "name"
    t.text     "description"
    t.text     "short_code"
    t.integer  "dis_number",  :default => 0
    t.boolean  "status",      :default => false
    t.integer  "created_by"
    t.integer  "updated_by"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "divisions", :force => true do |t|
    t.integer  "state_id"
    t.string   "name"
    t.text     "description"
    t.string   "short_code"
    t.boolean  "status",      :default => false
    t.integer  "created_by"
    t.integer  "updated_by"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "states", :force => true do |t|
    t.string   "name"
    t.string   "reference_code"
    t.string   "description"
    t.boolean  "status",         :default => false
    t.integer  "created_by"
    t.integer  "modified_by"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
