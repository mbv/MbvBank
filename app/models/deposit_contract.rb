# frozen_string_literal: true
# == Schema Information
#
# Table name: deposit_contracts
#
#  id                 :integer          not null, primary key
#  client_id          :integer
#  deposit_id         :integer
#  start_date         :date
#  end_date           :date
#  main_account_id    :integer
#  current_account_id :integer
#  closed             :boolean
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#
# Indexes
#
#  index_deposit_contracts_on_client_id   (client_id)
#  index_deposit_contracts_on_deposit_id  (deposit_id)
#
# Foreign Keys
#
#  fk_rails_...  (client_id => clients.id)
#  fk_rails_...  (deposit_id => deposits.id)
#

class DepositContract < ApplicationRecord
  belongs_to :client
  belongs_to :deposit
  belongs_to :main_account, class_name: 'Account', optional: true, dependent: :destroy
  belongs_to :current_account, class_name: 'Account', optional: true, dependent: :destroy

  attr_accessor :amount

  validates :amount, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 100_000_000_000 },
            presence: true, on: :create

  def interest_amount_per_day
    main_account.amount * deposit.rate / 100 / days_in_a_year
  end

  def days_in_a_year
    Time.zone.today.end_of_year.yday
  end

  def full_amount
    main_account.amount + current_account.amount
  end

  def revocable?
    !closed && deposit.deposit_type.revocable
  end
end
