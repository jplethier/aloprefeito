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

ActiveRecord::Schema.define(:version => 20120901195251) do

  create_table "attachments", :force => true do |t|
    t.string   "attachment_file_name"
    t.string   "attachment_content_type"
    t.integer  "attachment_file_size"
    t.date     "attachment_updated_at"
    t.float    "latitude"
    t.float    "longitude"
    t.integer  "complaint_id",            :null => false
    t.datetime "created_at",              :null => false
    t.datetime "updated_at",              :null => false
    t.string   "street"
    t.string   "city"
    t.string   "country"
    t.string   "url"
    t.integer  "type"
  end

  create_table "complaints", :force => true do |t|
    t.string   "title"
    t.text     "description",                    :null => false
    t.boolean  "anonymous",   :default => false, :null => false
    t.boolean  "resolved",    :default => false, :null => false
    t.integer  "user_id"
    t.datetime "created_at",                     :null => false
    t.datetime "updated_at",                     :null => false
  end

  create_table "interests", :force => true do |t|
    t.integer  "user_id",                        :null => false
    t.integer  "complaint_id",                   :null => false
    t.boolean  "send_email",   :default => true
    t.datetime "created_at",                     :null => false
    t.datetime "updated_at",                     :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "first_name",                         :null => false
    t.string   "last_name"
    t.string   "email"
    t.string   "provider",                           :null => false
    t.string   "uid",                                :null => false
    t.string   "fb_token"
    t.datetime "created_at",                         :null => false
    t.datetime "updated_at",                         :null => false
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",       :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true

end
