json.extract! deposit_contract, :id, :client_id, :deposit_id, :start_date, :end_date, :main_account, :current_account, :closed, :created_at, :updated_at
json.url deposit_contract_url(deposit_contract, format: :json)
