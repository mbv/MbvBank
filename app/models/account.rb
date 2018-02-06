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
#  real_amount  :decimal(19, 2)
#  amount       :decimal(19, 2)
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
  belongs_to :client
  belongs_to :currency

  enum account_type: {
    deposit:               'Deposit',
    credit:                'Credit',
    cashbox:               'Cashbox',
    bank_development_fund: 'Bank Development Fund'
  }

  ACCOUNT_NUMBER_PREFIX = {
    deposit:               '3014',
    credit:                '2400',
    cashbox:               '1010',
    bank_development_fund: '7327'
  }.freeze

  enum activity: {
    active:  'Active',
    passive: 'Passive'
  }

  def generate_number_and_pin
    self.number = "#{ACCOUNT_NUMBER_PREFIX[account_type]}#{format('%04d', client_id)}#{format('%04d', id)}1"
    self.pin    = format('%04d', rand(10_000))
    save
  end
end
