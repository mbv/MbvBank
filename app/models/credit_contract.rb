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
  belongs_to :main_account, class_name: 'Account', optional: true
  belongs_to :current_account, class_name: 'Account', optional: true

  enum contract_type: {
    annuity:        'Annuity',
    differentiated: 'Differentiated'
  }

  attr_accessor :amount

  validates :amount, numericality: true, presence: true
  validate :can_borrow_amount

  def can_borrow_amount
    bank_fund_account = Account.find_by(account_type: :bank_development_fund,
                                        currency:     credit.currency)
    return if errors.present?
    errors.add(:amount, "can't borrow all bank money") if amount.to_d > bank_fund_account.real_amount
  end
end
