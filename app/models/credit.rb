# == Schema Information
#
# Table name: credits
#
#  id             :integer          not null, primary key
#  credit_type_id :integer
#  currency_id    :integer
#  rate           :decimal(19, 2)
#  months         :integer
#
# Indexes
#
#  index_credits_on_credit_type_id  (credit_type_id)
#  index_credits_on_currency_id     (currency_id)
#
# Foreign Keys
#
#  fk_rails_...  (credit_type_id => credit_types.id)
#  fk_rails_...  (currency_id => currencies.id)
#

class Credit < ApplicationRecord
  belongs_to :credit_type
  belongs_to :currency

  def name
    "#{currency.code.upcase}, #{credit_type.name}: #{rate}% #{months} months"
  end

  def rate_per_month
    rate / 1200.0
  end
end
