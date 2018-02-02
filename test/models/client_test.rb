# frozen_string_literal: true

# == Schema Information
#
# Table name: clients
#
#  id                    :integer          not null, primary key
#  first_name            :string
#  last_name             :string
#  middle_name           :string
#  birth_date            :date
#  birth_place           :text
#  gender                :string           default("male")
#  passport_series       :string
#  passport_number       :string
#  identification_number :string
#  passport_issued_by    :string
#  passport_issue_date   :date
#  home_phone_number     :string
#  mobile_phone_number   :string
#  email                 :string
#  family_status         :string           default("single")
#  disability            :string           default("healthy")
#  pensioner             :boolean
#  monthly_income        :decimal(19, 2)
#  work_place            :text
#  work_position         :string
#  citizenship           :string           default("by")
#  registration_city     :string
#  registration_address  :text
#  actual_city           :string
#  actual_address        :text
#  reservist             :boolean
#  created_at            :datetime         not null
#  updated_at            :datetime         not null
#
# Indexes
#
#  index_clients_on_identification_number                (identification_number) UNIQUE
#  index_clients_on_passport_series_and_passport_number  (passport_series,passport_number) UNIQUE
#

require 'test_helper'

class ClientTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
