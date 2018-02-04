# frozen_string_literal: true

class CreateAccounts < ActiveRecord::Migration[5.1]
  def change
    create_table :accounts do |t|
      t.string :number
      t.string :name
      t.string :activity
      t.references :client, foreign_key: true
      t.decimal :real_amount, precision: 19, scale: 2
      t.decimal :amount, precision: 19, scale: 2
      t.references :currency, foreign_key: true
      t.boolean :closed
      t.string :pin

      t.timestamps
    end
  end
end
