class Account < ApplicationRecord
  belongs_to :client
  belongs_to :currency
end
