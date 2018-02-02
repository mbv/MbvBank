# frozen_string_literal: true

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

ActiveRecord::Schema.define(version: 20180202093456) do
  # These are extensions that must be enabled in order to support this database
  enable_extension 'plpgsql'

  create_table 'clients', force: :cascade do |t|
    t.string 'first_name'
    t.string 'last_name'
    t.string 'middle_name'
    t.date 'birth_date'
    t.text 'birth_place'
    t.string 'gender', default: 'male'
    t.string 'passport_series'
    t.string 'passport_number'
    t.string 'identification_number'
    t.string 'passport_issued_by'
    t.date 'passport_issue_date'
    t.string 'home_phone_number'
    t.string 'mobile_phone_number'
    t.string 'email'
    t.string 'family_status', default: 'single'
    t.string 'disability', default: 'healthy'
    t.boolean 'pensioner'
    t.decimal 'monthly_income', precision: 19, scale: 2
    t.text 'work_place'
    t.string 'work_position'
    t.string 'citizenship', default: 'by'
    t.string 'registration_city'
    t.text 'registration_address'
    t.string 'actual_city'
    t.text 'actual_address'
    t.boolean 'reservist'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['identification_number'], name: 'index_clients_on_identification_number', unique: true
    t.index %w[passport_series passport_number], name: 'index_clients_on_passport_series_and_passport_number', unique: true
  end
end
