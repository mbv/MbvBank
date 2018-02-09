# == Schema Information
#
# Table name: credit_contracts
#
#  id                 :integer          not null, primary key
#  client_id          :integer
#  credit_id          :integer
#  contract_type      :string
#  start_date         :date
#  end_date           :date
#  main_account_id    :integer
#  current_account_id :integer
#  next_payment_id    :integer
#  closed             :boolean          default(FALSE), not null
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#
# Indexes
#
#  index_credit_contracts_on_client_id  (client_id)
#  index_credit_contracts_on_credit_id  (credit_id)
#
# Foreign Keys
#
#  fk_rails_...  (client_id => clients.id)
#  fk_rails_...  (credit_id => credits.id)
#

class CreditContract < ApplicationRecord
  belongs_to :client
  belongs_to :credit
end
