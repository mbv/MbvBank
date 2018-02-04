# frozen_string_literal: true

# == Schema Information
#
# Table name: accounts
#
#  id          :integer          not null, primary key
#  number      :string
#  name        :string
#  activity    :string
#  client_id   :integer
#  real_amount :decimal(19, 2)
#  amount      :decimal(19, 2)
#  currency_id :integer
#  closed      :boolean
#  pin         :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
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
end
