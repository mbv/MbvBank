# frozen_string_literal: true

class CreateDepositContracts < ActiveRecord::Migration[5.1]
  def change
    create_table :deposit_contracts do |t|
      t.references :client, foreign_key: true
      t.references :deposit, foreign_key: true
      t.date :start_date
      t.date :end_date
      t.integer :main_account
      t.integer :current_account
      t.boolean :closed

      t.timestamps
    end
  end
end
