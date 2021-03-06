# frozen_string_literal: true

# == Schema Information
#
# Table name: deposits
#
#  id              :integer          not null, primary key
#  deposit_type_id :integer
#  currency_id     :integer
#  months          :integer
#  rate            :decimal(19, 2)
#
# Indexes
#
#  index_deposits_on_currency_id      (currency_id)
#  index_deposits_on_deposit_type_id  (deposit_type_id)
#
# Foreign Keys
#
#  fk_rails_...  (currency_id => currencies.id)
#  fk_rails_...  (deposit_type_id => deposit_types.id)
#

require 'test_helper'

class DepositTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
