class ChangeCreditModel < ActiveRecord::Migration[5.1]
  def change
    rename_column :credits, :amount, :rate
    remove_column :credits, :paid
    add_column :credits, :months, :integer
  end
end
