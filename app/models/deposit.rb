class Deposit < ApplicationRecord
  belongs_to :deposit_type
  belongs_to :currency
end
