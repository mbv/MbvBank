# == Schema Information
#
# Table name: credit_payments
#
#  id                 :integer          not null, primary key
#  credit_contract_id :integer
#  date               :date
#  amount             :decimal(19, 2)
#  paid               :boolean          default(FALSE), not null
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#
# Indexes
#
#  index_credit_payments_on_credit_contract_id  (credit_contract_id)
#
# Foreign Keys
#
#  fk_rails_...  (credit_contract_id => credit_contracts.id)
#

class CreditPayment < ApplicationRecord
  belongs_to :credit_contract
  has_one :credit_contract_through_next,
          class_name: 'CreditContract',
          foreign_key: :next_payment_id,
          inverse_of: :next_payment,
          dependent: :nullify

  def next_payment?
    !credit_contract_through_next.nil?
  end
end
