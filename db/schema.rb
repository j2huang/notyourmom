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

ActiveRecord::Schema.define(:version => 20121106173713) do

  create_table "authentications", :force => true do |t|
    t.integer  "user_id"
    t.string   "provider"
    t.string   "uid"
    t.string   "token"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "comments", :force => true do |t|
    t.text    "comment"
    t.integer "expense_id"
    t.integer "user_id"
  end

  add_index "comments", ["expense_id"], :name => "index_comments_on_expense_id"
  add_index "comments", ["user_id"], :name => "index_comments_on_user_id"

  create_table "debts", :force => true do |t|
    t.float   "percentage_owed"
    t.boolean "paid"
    t.integer "user_id"
    t.integer "expense_id"
  end

  add_index "debts", ["expense_id"], :name => "index_debts_on_expense_id"
  add_index "debts", ["user_id"], :name => "index_debts_on_user_id"

  create_table "expenses", :force => true do |t|
    t.float    "price"
    t.string   "item"
    t.text     "description"
    t.boolean  "resolved"
    t.integer  "user_id"
    t.integer  "household_id"
    t.datetime "created_at"
  end

  add_index "expenses", ["user_id"], :name => "index_expenses_on_user_id"

  create_table "households", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "tags", :force => true do |t|
    t.string  "tag"
    t.integer "expense_id"
  end

  add_index "tags", ["expense_id"], :name => "index_tags_on_expense_id"

  create_table "users", :force => true do |t|
    t.string   "firstName"
    t.string   "lastName"
    t.string   "email"
    t.string   "password"
    t.string   "fb_key"
    t.integer  "household_id"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
