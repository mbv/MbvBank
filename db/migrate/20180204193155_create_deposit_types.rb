# frozen_string_literal: true

class CreateDepositTypes < ActiveRecord::Migration[5.1]
  def change
    create_table :deposit_types do |t|
      t.string :name
      t.boolean :revocable

      t.timestamps
    end
  end
end
