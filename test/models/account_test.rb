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

require 'test_helper'

class AccountTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
