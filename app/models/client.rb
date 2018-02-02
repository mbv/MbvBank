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
#  citizenship           :string           default("BY")
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

class Client < ApplicationRecord
  enum gender: {
    male:   'male',
    female: 'female',
    other:  'other'
  }
  enum family_status: {
    single:   'single',
    married: 'married',
    divorced: 'divorced',
    widowed:  'widowed'
  }
  enum disability: {
    healthy:   'healthy',
    disabled: 'disabled'
  }

  validates :first_name, :last_name, :middle_name, :birth_date, :gender, :passport_series, :passport_number,
            :identification_number, :birth_place, :passport_issued_by, :passport_issue_date, :actual_city,
            :registration_address, :registration_city, :registration_address, :family_status, :citizenship, :disability,
            :pensioner, :reservist, presence: true
end
