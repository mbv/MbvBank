# frozen_string_literal: true

# == Schema Information
#
# Table name: deposit_types
#
#  id         :integer          not null, primary key
#  name       :string
#  revocable  :boolean
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class DepositTypeTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
