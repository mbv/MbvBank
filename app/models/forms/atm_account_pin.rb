module Forms
  class AtmAccountPin
    include ActiveModel::Validations
    include ActiveModel::Conversion

    attr_accessor :pin

    validates :pin, length: { is: 4 }, numericality: { only_integer: true }, presence: true

    def initialize(params = {})
      self.pin = params[:pin]
    end

    def persisted?
      false
    end
  end
end