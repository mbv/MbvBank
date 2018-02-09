class CreateCredits < ActiveRecord::Migration[5.1]
  def change
    create_table :credits do |t|
      t.references :credit_type, foreign_key: true
      t.references :currency, foreign_key: true
      t.decimal :amount, precision: 19, scale: 2
      t.boolean :paid, default: false, null: false
    end
  end
end
