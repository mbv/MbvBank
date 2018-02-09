class CreateCreditTypes < ActiveRecord::Migration[5.1]
  def change
    create_table :credit_types do |t|
      t.string :name
    end
  end
end
