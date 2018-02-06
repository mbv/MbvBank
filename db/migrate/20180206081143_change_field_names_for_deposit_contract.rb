# frozen_string_literal: true

class ChangeFieldNamesForDepositContract < ActiveRecord::Migration[5.1]
  def change
    rename_column :deposit_contracts, :main_account, :main_account_id
    rename_column :deposit_contracts, :current_account, :current_account_id
  end
end
