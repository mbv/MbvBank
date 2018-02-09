class CreateCreditPayments < ActiveRecord::Migration[5.1]
  def change
    create_table :credit_payments do |t|
      t.references :credit_contract, foreign_key: true
      t.date :date
      t.decimal :amount, precision: 19, scale: 2
      t.boolean :paid, default: false, null: false

      t.timestamps
    end
  end
end
