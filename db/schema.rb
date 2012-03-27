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

ActiveRecord::Schema.define(:version => 20120327045232) do

  create_table "advisors", :force => true do |t|
    t.integer  "contact_id"
    t.string   "first_name"
    t.string   "last_name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "board_members", :force => true do |t|
    t.integer  "contact_id"
    t.string   "first_name"
    t.string   "last_name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "contact_addresses", :force => true do |t|
    t.integer  "contact_id"
    t.string   "address"
    t.string   "city"
    t.string   "state"
    t.string   "zip"
    t.string   "country"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "contact_emails", :force => true do |t|
    t.integer  "contact_id"
    t.string   "email_address"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "contact_phones", :force => true do |t|
    t.integer  "contact_id"
    t.integer  "phone_number"
    t.integer  "phone_type_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "contact_types", :force => true do |t|
    t.string   "contact_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "contacts", :force => true do |t|
    t.integer  "contact_type_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "education_companies", :force => true do |t|
    t.integer  "contact_id"
    t.string   "name"
    t.integer  "representative_id"
    t.string   "representative_role"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "images", :force => true do |t|
    t.integer  "contact_id"
    t.string   "file_path"
    t.boolean  "active"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "individuals", :force => true do |t|
    t.integer  "contact_id"
    t.string   "first_name"
    t.string   "last_name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "jobs", :force => true do |t|
    t.integer  "contact_id"
    t.date     "date"
    t.integer  "number"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "notes", :force => true do |t|
    t.integer  "contact_id"
    t.text     "note"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "phone_types", :force => true do |t|
    t.string   "phone_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "portfolio_companies", :force => true do |t|
    t.integer  "contact_id"
    t.string   "name"
    t.integer  "representative_id"
    t.string   "representative_role"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "professional_service_providers", :force => true do |t|
    t.integer  "contact_id"
    t.string   "name"
    t.integer  "representative_id"
    t.string   "representative_role"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "revenues", :force => true do |t|
    t.integer  "contact_id"
    t.date     "date"
    t.integer  "amount"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "working_relationships", :force => true do |t|
    t.integer  "company_id"
    t.integer  "client_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
