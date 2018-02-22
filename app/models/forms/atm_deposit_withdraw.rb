module Forms
  class AtmDepositWithdraw
    include ActiveModel::Validations
    include ActiveModel::Conversion

    attr_accessor :amount

    validates :amount, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 100_000_000_000 }, presence: true

    def initialize(params = {})
      self.amount = params[:amount]
    end

    def persisted?
      false
    end
  end
end