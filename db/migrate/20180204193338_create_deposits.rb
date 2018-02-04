# frozen_string_literal: true

class CreateDeposits < ActiveRecord::Migration[5.1]
  def change
    create_table :deposits do |t|
      t.references :deposit_type, foreign_key: true
      t.references :currency, foreign_key: true
      t.integer :months
      t.decimal :rate, precision: 19, scale: 2
    end
  end
end
