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

ActiveRecord::Schema.define(:version => 20121217201251) do

  create_table "accounts", :force => true do |t|
    t.integer  "child_id"
    t.integer  "family_id"
    t.string   "name"
    t.decimal  "balance"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "allowances", :force => true do |t|
    t.integer  "child_id"
    t.integer  "family_id"
    t.string   "name"
    t.string   "payday"
    t.string   "frequency"
    t.decimal  "amount"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "chores", :force => true do |t|
    t.integer  "parent_id"
    t.integer  "child_id"
    t.integer  "family_id"
    t.string   "name"
    t.string   "description"
    t.boolean  "is_allowance"
    t.decimal  "amount"
    t.boolean  "is_approved"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "families", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "percentages", :force => true do |t|
    t.integer  "allowance_id"
    t.integer  "account_id"
    t.float    "percentage"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "transactions", :force => true do |t|
    t.integer  "account_id"
    t.integer  "parent_id"
    t.integer  "family_id"
    t.string   "description"
    t.string   "memo"
    t.boolean  "is_credit"
    t.decimal  "strt_balance"
    t.decimal  "amt_change"
    t.decimal  "end_balance"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "last_name"
    t.string   "first_name"
    t.string   "email"
    t.string   "text_number"
    t.boolean  "is_parent"
    t.integer  "family_id"
    t.string   "password_digest"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

end
