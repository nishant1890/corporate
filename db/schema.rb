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

ActiveRecord::Schema.define(version: 20170209185102) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

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

  create_table "erp_operating_expenses", force: :cascade do |t|
    t.integer  "paycheck",   default: 0
    t.integer  "insurance",  default: 0
    t.integer  "office",     default: 0
    t.integer  "utilities",  default: 0
    t.integer  "internet",   default: 0
    t.integer  "phone",      default: 0
    t.integer  "rt",         default: 0
    t.integer  "salesforce", default: 0
    t.integer  "sf_admin",   default: 0
    t.integer  "sms_magic",  default: 0
    t.integer  "lindexed",   default: 0
    t.date     "start_date"
    t.date     "end_date"
    t.integer  "company_id"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
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
    t.string   "type"
  end

  create_table "houses", force: :cascade do |t|
    t.string   "company_id"
    t.text     "address"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "marketing_fixed_expenses", force: :cascade do |t|
    t.integer  "southwest",         default: 0
    t.integer  "west_coast",        default: 0
    t.integer  "midwest",           default: 0
    t.integer  "new_england",       default: 0
    t.integer  "south_east",        default: 0
    t.integer  "sober_recover",     default: 0
    t.integer  "easy_breeze",       default: 0
    t.integer  "addiction_advisor", default: 0
    t.integer  "visible",           default: 0
    t.integer  "air_time",          default: 0
    t.integer  "rehabs_hq",         default: 0
    t.integer  "drug_use_today",    default: 0
    t.integer  "facebook",          default: 0
    t.date     "start_date"
    t.date     "end_date"
    t.integer  "company_id"
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
  end

  create_table "owner_salary_components", force: :cascade do |t|
    t.integer  "owner_salary",      default: 0
    t.integer  "owner_commission",  default: 0
    t.integer  "spouse_salary",     default: 0
    t.integer  "spouse_commission", default: 0
    t.date     "start_date"
    t.date     "end_date"
    t.integer  "company_id"
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
  end

  create_table "revenues", force: :cascade do |t|
    t.string   "company_name"
    t.string   "type_of_revenue"
    t.string   "number_of_deals"
    t.integer  "amount",          default: 0
    t.date     "date"
    t.integer  "company_id"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  create_table "sunshine_center_other_expenses", force: :cascade do |t|
    t.integer  "hosting",              default: 0
    t.integer  "blogging",             default: 0
    t.integer  "facebook",             default: 0
    t.integer  "liability_insurance",  default: 0
    t.integer  "heath_insurance",      default: 0
    t.integer  "detox",                default: 0
    t.integer  "workers_compensation", default: 0
    t.integer  "fica",                 default: 0
    t.integer  "office_supplies",      default: 0
    t.integer  "cort",                 default: 0
    t.integer  "kipu",                 default: 0
    t.integer  "miscellaneous",        default: 0
    t.date     "start_date"
    t.date     "end_date"
    t.integer  "company_id"
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
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
    t.boolean  "admin"
    t.text     "permission",             default: [],              array: true
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  create_table "utility_expenses", force: :cascade do |t|
    t.integer  "cable",           default: 0
    t.integer  "gas",             default: 0
    t.integer  "electric",        default: 0
    t.integer  "water",           default: 0
    t.integer  "food",            default: 0
    t.integer  "yoga",            default: 0
    t.integer  "acupunture",      default: 0
    t.integer  "auto",            default: 0
    t.integer  "fuel",            default: 0
    t.integer  "landscaping",     default: 0
    t.integer  "cleaning",        default: 0
    t.integer  "total_per_house", default: 0
    t.date     "start_date"
    t.date     "end_date"
    t.integer  "company_id"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

end
