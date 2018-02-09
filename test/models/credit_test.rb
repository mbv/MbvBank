# == Schema Information
#
# Table name: credits
#
#  id             :integer          not null, primary key
#  credit_type_id :integer
#  currency_id    :integer
#  amount         :decimal(19, 2)
#  paid           :boolean          default(FALSE), not null
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

require 'test_helper'

class CreditTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
