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

ActiveRecord::Schema.define(version: 20180209195033) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "accounts", force: :cascade do |t|
    t.string "number"
    t.string "name"
    t.string "activity"
    t.bigint "client_id"
    t.decimal "real_amount", precision: 19, scale: 2, default: "0.0", null: false
    t.decimal "amount", precision: 19, scale: 2, default: "0.0", null: false
    t.bigint "currency_id"
    t.boolean "closed"
    t.string "pin"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "account_type"
    t.index ["client_id"], name: "index_accounts_on_client_id"
    t.index ["currency_id"], name: "index_accounts_on_currency_id"
  end

  create_table "clients", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "middle_name"
    t.date "birth_date"
    t.text "birth_place"
    t.string "gender", default: "male"
    t.string "passport_series"
    t.string "passport_number"
    t.string "identification_number"
    t.string "passport_issued_by"
    t.date "passport_issue_date"
    t.string "home_phone_number"
    t.string "mobile_phone_number"
    t.string "email"
    t.string "family_status", default: "single"
    t.string "disability", default: "healthy"
    t.boolean "pensioner"
    t.decimal "monthly_income", precision: 19, scale: 2
    t.text "work_place"
    t.string "work_position"
    t.string "citizenship", default: "BY"
    t.string "registration_city"
    t.text "registration_address"
    t.string "actual_city"
    t.text "actual_address"
    t.boolean "reservist"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["identification_number"], name: "index_clients_on_identification_number", unique: true
    t.index ["passport_series", "passport_number"], name: "index_clients_on_passport_series_and_passport_number", unique: true
  end

  create_table "credit_contracts", force: :cascade do |t|
    t.bigint "client_id"
    t.bigint "credit_id"
    t.string "contract_type"
    t.date "start_date"
    t.date "end_date"
    t.integer "main_account_id"
    t.integer "current_account_id"
    t.integer "next_payment_id"
    t.boolean "closed", default: false, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["client_id"], name: "index_credit_contracts_on_client_id"
    t.index ["credit_id"], name: "index_credit_contracts_on_credit_id"
  end

  create_table "credit_payments", force: :cascade do |t|
    t.bigint "credit_contract_id"
    t.date "date"
    t.decimal "amount", precision: 19, scale: 2
    t.boolean "paid", default: false, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["credit_contract_id"], name: "index_credit_payments_on_credit_contract_id"
  end

  create_table "credit_types", force: :cascade do |t|
    t.string "name"
  end

  create_table "credits", force: :cascade do |t|
    t.bigint "credit_type_id"
    t.bigint "currency_id"
    t.decimal "rate", precision: 19, scale: 2
    t.integer "months"
    t.index ["credit_type_id"], name: "index_credits_on_credit_type_id"
    t.index ["currency_id"], name: "index_credits_on_currency_id"
  end

  create_table "currencies", force: :cascade do |t|
    t.string "code"
    t.string "name"
  end

  create_table "deposit_contracts", force: :cascade do |t|
    t.bigint "client_id"
    t.bigint "deposit_id"
    t.date "start_date"
    t.date "end_date"
    t.integer "main_account_id"
    t.integer "current_account_id"
    t.boolean "closed"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["client_id"], name: "index_deposit_contracts_on_client_id"
    t.index ["deposit_id"], name: "index_deposit_contracts_on_deposit_id"
  end

  create_table "deposit_types", force: :cascade do |t|
    t.string "name"
    t.boolean "revocable"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "deposits", force: :cascade do |t|
    t.bigint "deposit_type_id"
    t.bigint "currency_id"
    t.integer "months"
    t.decimal "rate", precision: 19, scale: 2
    t.index ["currency_id"], name: "index_deposits_on_currency_id"
    t.index ["deposit_type_id"], name: "index_deposits_on_deposit_type_id"
  end

  create_table "transactions", force: :cascade do |t|
    t.bigint "account_id"
    t.decimal "amount", precision: 19, scale: 2
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["account_id"], name: "index_transactions_on_account_id"
  end

  add_foreign_key "accounts", "clients"
  add_foreign_key "accounts", "currencies"
  add_foreign_key "credit_contracts", "clients"
  add_foreign_key "credit_contracts", "credits"
  add_foreign_key "credit_payments", "credit_contracts"
  add_foreign_key "credits", "credit_types"
  add_foreign_key "credits", "currencies"
  add_foreign_key "deposit_contracts", "clients"
  add_foreign_key "deposit_contracts", "deposits"
  add_foreign_key "deposits", "currencies"
  add_foreign_key "deposits", "deposit_types"
  add_foreign_key "transactions", "accounts"
end
