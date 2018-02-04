# frozen_string_literal: true

# == Schema Information
#
# Table name: transactions
#
#  id         :integer          not null, primary key
#  account_id :integer
#  amount     :decimal(19, 2)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_transactions_on_account_id  (account_id)
#
# Foreign Keys
#
#  fk_rails_...  (account_id => accounts.id)
#

require 'test_helper'

class TransactionTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
