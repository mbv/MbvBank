class Credit < ApplicationRecord
  belongs_to :credit_type
  belongs_to :currency
end
