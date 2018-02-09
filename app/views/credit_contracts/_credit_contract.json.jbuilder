json.extract! credit_contract, :id, :client_id, :credit_id, :contract_type, :start_date, :end_date, :main_account_id, :current_account_id, :next_payment_id, :closed, :created_at, :updated_at
json.url credit_contract_url(credit_contract, format: :json)
