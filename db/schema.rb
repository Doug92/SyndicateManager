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

ActiveRecord::Schema.define(:version => 20121129202115) do

  create_table "lottery_selections", :force => true do |t|
    t.integer  "syndicate_id"
    t.integer  "lottery_selection_1"
    t.integer  "lottery_selection_2"
    t.integer  "lottery_selection_3"
    t.integer  "lottery_selection_4"
    t.integer  "lottery_selection_5"
    t.integer  "lottery_selection_6"
    t.datetime "lottery_selection_date"
    t.datetime "created_at",             :null => false
    t.datetime "updated_at",             :null => false
  end

  create_table "payments", :force => true do |t|
    t.integer  "user_id"
    t.decimal  "payment_amount", :precision => 4, :scale => 2
    t.datetime "payment_date"
    t.datetime "created_at",                                   :null => false
    t.datetime "updated_at",                                   :null => false
  end

  create_table "syndicates", :force => true do |t|
    t.string   "syndicate_name"
    t.datetime "created_at",                            :null => false
    t.datetime "updated_at",                            :null => false
    t.string   "status",         :default => "pending"
  end

  create_table "syndicates_users", :id => false, :force => true do |t|
    t.integer "user_id"
    t.integer "syndicate_id"
  end

  create_table "users", :force => true do |t|
    t.string   "user_surname"
    t.string   "user_firstname"
    t.string   "email"
    t.string   "user_status"
    t.string   "user_payment_status"
    t.string   "user_type"
    t.decimal  "current_balance",     :precision => 4, :scale => 2
    t.datetime "created_at",                                                           :null => false
    t.datetime "updated_at",                                                           :null => false
    t.string   "password_digest"
    t.string   "remember_token"
    t.boolean  "admin",                                             :default => false
    t.boolean  "manager",                                           :default => false
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["remember_token"], :name => "index_users_on_remember_token"

  create_table "winning_numbers", :force => true do |t|
    t.datetime "winning_numbers_date"
    t.integer  "winning_number_1"
    t.integer  "winning_number_2"
    t.integer  "winning_number_3"
    t.integer  "winning_number_4"
    t.integer  "winning_number_5"
    t.integer  "winning_number_6"
    t.integer  "winning_number_bonus"
    t.datetime "created_at",           :null => false
    t.datetime "updated_at",           :null => false
  end

end
