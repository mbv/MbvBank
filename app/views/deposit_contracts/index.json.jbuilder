# frozen_string_literal: true

json.array! @deposit_contracts, partial: 'deposit_contracts/deposit_contract', as: :deposit_contract
