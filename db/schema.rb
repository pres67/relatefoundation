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

ActiveRecord::Schema.define(:version => 20111110184401) do

  create_table "callbacks", :force => true do |t|
    t.string   "url"
    t.datetime "created_at"
  end

  create_table "customers", :force => true do |t|
    t.string   "user_id"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "page_loads", :force => true do |t|
    t.string   "url"
    t.datetime "create_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "transaction_failures", :force => true do |t|
    t.string   "status"
    t.string   "result_dump"
    t.string   "result_params_dump"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "transactions", :force => true do |t|
    t.integer  "transaction_id"
    t.string   "type"
    t.integer  "amount"
    t.string   "status"
    t.datetime "braintree_created_at"
    t.datetime "braintree_updated_at"
    t.string   "token"
    t.string   "bin"
    t.integer  "last_4"
    t.string   "card_type"
    t.datetime "expiration_date"
    t.string   "cardholder_name"
    t.string   "customer_location"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "masked_number"
    t.datetime "create_at"
    t.string   "callb"
    t.string   "user_id"
    t.string   "custom_fields_dump"
    t.string   "transaction_dump"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
