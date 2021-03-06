# frozen_string_literal: true

class CreateCurrencies < ActiveRecord::Migration[5.1]
  def change
    create_table :currencies do |t|
      t.string :code
      t.string :name
    end
  end
end
