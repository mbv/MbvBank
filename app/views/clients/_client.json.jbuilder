# frozen_string_literal: true

json.extract! client, %i[id first_name last_name middle_name birth_date birth_place gender
                         passport_series passport_number identification_number passport_issued_by
                         passport_issue_date home_phone_number mobile_phone_number email family_status
                         disability pensioner monthly_income work_place work_position citizenship
                         registration_city registration_address actual_city actual_address reservist
                         created_at updated_at]
json.url client_url(client, format: :json)
