# frozen_string_literal: true

class AddDefaultValueForAmountsInAccount < ActiveRecord::Migration[5.1]
  def change
    change_column :accounts, :real_amount, :decimal, precision: 19, scale: 2, null: false, default: 0
    change_column :accounts, :amount, :decimal, precision: 19, scale: 2, null: false, default: 0
  end
end
