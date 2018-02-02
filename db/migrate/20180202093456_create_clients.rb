# frozen_string_literal: true

class CreateClients < ActiveRecord::Migration[5.1]
  def change
    create_table :clients do |t|
      t.string :first_name
      t.string :last_name
      t.string :middle_name
      t.date :birth_date
      t.text :birth_place
      t.string :gender, default: :male
      t.string :passport_series
      t.string :passport_number
      t.string :identification_number
      t.string :passport_issued_by
      t.date :passport_issue_date
      t.string :home_phone_number
      t.string :mobile_phone_number
      t.string :email
      t.string :family_status, default: :single
      t.string :disability, default: :healthy
      t.boolean :pensioner
      t.decimal :monthly_income, precision: 19, scale: 2
      t.text :work_place
      t.string :work_position
      t.string :citizenship, default: :BY
      t.string :registration_city
      t.text :registration_address
      t.string :actual_city
      t.text :actual_address
      t.boolean :reservist

      t.timestamps

      t.index :identification_number, unique: true
      t.index %i[passport_series passport_number], unique: true
    end
  end
end
