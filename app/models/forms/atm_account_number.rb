module Forms
  class AtmAccountNumber
    include ActiveModel::Validations
    include ActiveModel::Conversion

    attr_accessor :account_number

    validates :account_number, length: { is: 13 }, numericality: { only_integer: true }, presence: true

    def initialize(params = {})
      self.account_number = params[:account_number]
    end

    def persisted?
      false
    end
  end
end