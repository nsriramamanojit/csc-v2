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

ActiveRecord::Schema.define(:version => 10) do

  create_table "assignments", :force => true do |t|
    t.integer  "user_id"
    t.integer  "role_id"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "blocks", :force => true do |t|
    t.integer  "state_id"
    t.integer  "division_id"
    t.integer  "district_id"
    t.string   "name"
    t.string   "description"
    t.string   "short_code"
    t.boolean  "status",      :default => false
    t.integer  "created_by"
    t.integer  "updated_by"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "districts", :force => true do |t|
    t.integer  "state_id"
    t.integer  "division_id"
    t.string   "name"
    t.string   "description"
    t.string   "short_code"
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
    t.string   "description"
    t.string   "short_code"
    t.boolean  "status",      :default => false
    t.integer  "created_by"
    t.integer  "updated_by"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "panchayats", :force => true do |t|
    t.string   "name"
    t.string   "description"
    t.integer  "state_id"
    t.integer  "division_id"
    t.integer  "district_id"
    t.integer  "block_id"
    t.boolean  "status",      :default => true
    t.integer  "created_by"
    t.integer  "modified_by"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "roles", :force => true do |t|
    t.string   "name"
    t.string   "description"
    t.string   "reference_code"
    t.boolean  "status",         :default => true
    t.integer  "created_by"
    t.integer  "modified_by"
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

  create_table "user_profiles", :force => true do |t|
    t.integer  "user_id"
    t.integer  "state_id"
    t.integer  "division_id"
    t.integer  "district_id"
    t.integer  "block_id"
    t.integer  "panchayat_id"
    t.string   "csc_code"
    t.string   "vle_code"
    t.float    "balance",               :default => 0.0
    t.string   "payment_mode"
    t.string   "bank_name"
    t.string   "branch"
    t.integer  "instrument_number"
    t.date     "instrument_date"
    t.text     "remarks"
    t.string   "id_proof_file_name"
    t.string   "id_proof_content_type"
    t.integer  "id_proof_file_size"
    t.datetime "id_proof_updated_at"
    t.string   "agreement1_file_name"
    t.integer  "agreement1_file_size"
    t.datetime "agreement1_updated_at"
    t.string   "agreement2_file_name"
    t.integer  "agreement2_file_size"
    t.datetime "agreement2_updated_at"
    t.string   "agreement3_file_name"
    t.integer  "agreement3_file_size"
    t.datetime "agreement3_updated_at"
    t.string   "agreement4_file_name"
    t.integer  "agreement4_file_size"
    t.datetime "agreement4_updated_at"
    t.string   "agreement5_file_name"
    t.integer  "agreement5_file_size"
    t.datetime "agreement5_updated_at"
    t.string   "agreement6_file_name"
    t.integer  "agreement6_file_size"
    t.datetime "agreement6_updated_at"
    t.string   "agreement7_file_name"
    t.integer  "agreement7_file_size"
    t.datetime "agreement7_updated_at"
    t.string   "agreement8_file_name"
    t.integer  "agreement8_file_size"
    t.datetime "agreement8_updated_at"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "user_sessions", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "email"
    t.string   "name"
    t.string   "father_name"
    t.string   "gender"
    t.date     "dob"
    t.string   "address1"
    t.string   "address2"
    t.string   "address3"
    t.string   "place"
    t.string   "pin"
    t.string   "mobile_number"
    t.string   "phone_number"
    t.string   "verification_code"
    t.string   "verification_date"
    t.string   "crypted_password"
    t.string   "password_salt"
    t.string   "persistence_token",                      :null => false
    t.string   "perishable_token",    :default => "",    :null => false
    t.integer  "login_count",         :default => 0,     :null => false
    t.datetime "last_request_at"
    t.datetime "last_login_at"
    t.datetime "current_login_at"
    t.string   "last_login_ip"
    t.string   "current_login_ip"
    t.boolean  "status",              :default => false
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
