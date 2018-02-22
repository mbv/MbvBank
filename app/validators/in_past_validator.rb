# frozen_string_literal: true

class InPastValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    if value.blank?
      record.errors.add attribute, (options[:message] || "can't be blank")
    elsif record.errors.empty? && value.to_date > Time.zone.today
      record.errors.add attribute,
                        (options[:message] || "can't be in the future")
    end
  end
end