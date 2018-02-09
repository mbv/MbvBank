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
#  gender                :string           default(NULL)
#  passport_series       :string
#  passport_number       :string
#  identification_number :string
#  passport_issued_by    :string
#  passport_issue_date   :date
#  home_phone_number     :string
#  mobile_phone_number   :string
#  email                 :string
#  family_status         :string           default(NULL)
#  disability            :string           default(NULL)
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
  has_many :deposit_contracts, dependent: :destroy
  has_many :credit_contracts, dependent: :destroy

  enum gender: {
    male:   'Male',
    female: 'Female',
    other:  'Other'
  }
  enum family_status: {
    single:   'Single',
    married:  'Married',
    divorced: 'Divorced',
    widowed:  'Widowed'
  }
  enum disability: {
    healthy:  'Healthy',
    disabled: 'Disabled'
  }

  CITIES = {
    minsk:   'Minsk',
    moscow:  'Moscow',
    ny:      'New York',
    gomel:      'Gomel',
    beijing: 'Beijing'
  }.freeze

  validates :first_name, :last_name, :middle_name, :birth_date, :gender, :passport_series, :passport_number,
            :identification_number, :birth_place, :passport_issued_by, :passport_issue_date, :actual_city,
            :registration_address, :registration_city, :registration_address, :family_status, :citizenship, :disability,
            presence: true
  validates :passport_series, uniqueness: { scope: :passport_number }
  validates :identification_number, uniqueness: true

  def full_name
    [last_name, first_name, middle_name].compact.join(' ')
  end

  def full_passport
    passport_series + passport_number
  end
end
