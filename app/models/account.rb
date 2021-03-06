# frozen_string_literal: true
# == Schema Information
#
# Table name: accounts
#
#  id           :integer          not null, primary key
#  number       :string
#  name         :string
#  activity     :string
#  client_id    :integer
#  real_amount  :decimal(19, 2)   default(0.0), not null
#  amount       :decimal(19, 2)   default(0.0), not null
#  currency_id  :integer
#  closed       :boolean
#  pin          :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  account_type :string
#
# Indexes
#
#  index_accounts_on_client_id    (client_id)
#  index_accounts_on_currency_id  (currency_id)
#
# Foreign Keys
#
#  fk_rails_...  (client_id => clients.id)
#  fk_rails_...  (currency_id => currencies.id)
#

class Account < ApplicationRecord
  belongs_to :client, optional: true
  belongs_to :currency

  has_one :deposit_contract_through_main,
          class_name: 'DepositContract',
          foreign_key: :main_account_id,
          inverse_of: :main_account,
          dependent: :nullify
  has_one :deposit_contract_through_current,
          class_name: 'DepositContract',
          foreign_key: :current_account_id,
          inverse_of: :current_account,
          dependent: :nullify

  has_one :credit_contract_through_main,
          class_name: 'CreditContract',
          foreign_key: :main_account_id,
          inverse_of: :main_account,
          dependent: :nullify
  has_one :credit_contract_through_current,
          class_name: 'CreditContract',
          foreign_key: :current_account_id,
          inverse_of: :current_account,
          dependent: :nullify

  enum account_type: {
    deposit:               'Deposit',
    credit:                'Credit',
    bank_cashbox:          'Cashbox',
    bank_development_fund: 'Bank Development Fund'
  }

  ACCOUNT_NUMBER_PREFIX = {
    deposit:               '3014',
    credit:                '2400',
    bank_cashbox:          '1010',
    bank_development_fund: '7327'
  }.freeze

  enum activity: {
    active:         'Active',
    passive:        'Passive',
    active_passive: 'Active-Passive'
  }

  def generate_number_and_pin
    self.number = "#{ACCOUNT_NUMBER_PREFIX[account_type.to_sym]}#{format('%04d', client_id)}#{format('%04d', id)}1"
    self.pin    = format('%04d', rand(10_000))
    save
  end

  def main?
    return true if deposit? && !deposit_contract_through_main.nil?
    return true if credit? && !credit_contract_through_main.nil?
    false
  end

  def current?
    return true if deposit? && !deposit_contract_through_current.nil?
    return true if credit? && !credit_contract_through_current.nil?
    false
  end

  def deposit_contract
    return deposit_contract_through_main if main?
    deposit_contract_through_current
  end

  def credit_contract
    return credit_contract_through_main if main?
    credit_contract_through_current
  end

  def contract
    return deposit_contract if deposit?
    credit_contract
  end
end
