class CreateCreditContracts < ActiveRecord::Migration[5.1]
  def change
    create_table :credit_contracts do |t|
      t.references :client, foreign_key: true
      t.references :credit, foreign_key: true
      t.string :contract_type
      t.date :start_date
      t.date :end_date
      t.integer :main_account_id
      t.integer :current_account_id
      t.integer :next_payment_id
      t.boolean :closed, default: false, null: false

      t.timestamps
    end
  end
end
