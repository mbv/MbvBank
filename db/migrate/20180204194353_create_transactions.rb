class CreateTransactions < ActiveRecord::Migration[5.1]
  def change
    create_table :transactions do |t|
      t.references :account, foreign_key: true
      t.decimal :amount, precision: 19, scale: 2

      t.timestamps
    end
  end
end
