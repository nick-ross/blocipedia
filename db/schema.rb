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

ActiveRecord::Schema.define(:version => 20140407170309) do

  create_table "collaborations", :force => true do |t|
    t.integer  "user_id",    :null => false
    t.integer  "wiki_id",    :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "collaborations", ["user_id"], :name => "index_collaborations_on_user_id"
  add_index "collaborations", ["wiki_id"], :name => "index_collaborations_on_wiki_id"

  create_table "plans", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "subscriptions", :force => true do |t|
    t.integer  "user_id"
    t.integer  "plan_id"
    t.string   "email"
    t.string   "stripe_customer_token"
    t.datetime "created_at",            :null => false
    t.datetime "updated_at",            :null => false
  end

  add_index "subscriptions", ["plan_id"], :name => "index_subscriptions_on_plan_id"
  add_index "subscriptions", ["user_id"], :name => "index_subscriptions_on_user_id"

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "email",                  :default => "",       :null => false
    t.string   "encrypted_password",     :default => "",       :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0,        :null => false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.datetime "created_at",                                   :null => false
    t.datetime "updated_at",                                   :null => false
    t.string   "role",                   :default => "member"
  end

  add_index "users", ["confirmation_token"], :name => "index_users_on_confirmation_token", :unique => true
  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

  create_table "wikis", :force => true do |t|
    t.string   "title"
    t.text     "body"
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
    t.boolean  "private",    :default => false
    t.integer  "user_id"
  end

  add_index "wikis", ["user_id"], :name => "index_wikis_on_user_id"

end
