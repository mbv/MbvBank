class CreditContract < ApplicationRecord
  belongs_to :client
  belongs_to :credit
end
