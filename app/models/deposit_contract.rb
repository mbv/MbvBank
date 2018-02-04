class DepositContract < ApplicationRecord
  belongs_to :client
  belongs_to :deposit
  belongs_to :main_account, class_name: 'Account'
  belongs_to :current_account, class_name: 'Account'
end
