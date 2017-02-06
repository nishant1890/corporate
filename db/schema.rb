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

ActiveRecord::Schema.define(version: 20170202222938) do

  create_table "companies", force: :cascade do |t|
    t.string   "name"
    t.string   "website"
    t.string   "contact"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "company_lease_informations", force: :cascade do |t|
    t.string   "company_id"
    t.string   "house_id"
    t.string   "start_date"
    t.string   "end_date"
    t.string   "total_lease_amount"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  create_table "expenses", force: :cascade do |t|
    t.string   "company_name"
    t.date     "date"
    t.string   "amount"
    t.string   "payroll_type"
    t.string   "search_engine"
    t.string   "month"
    t.string   "year"
    t.string   "miscellaneous_expense_type"
    t.integer  "company_id"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  create_table "houses", force: :cascade do |t|
    t.string   "company_id"
    t.text     "address"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "revenues", force: :cascade do |t|
    t.string   "company_name"
    t.string   "type_of_revenue"
    t.string   "number_of_deals"
    t.string   "amount"
    t.string   "date"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.integer  "company_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
