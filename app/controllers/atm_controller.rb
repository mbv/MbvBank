class AtmController < ApplicationController
  before_action :validate_account_number, only: [:pin]

  def login
    @atm_account_number = Forms::AtmAccountNumber.new(atm_account_number_params)

    if @atm_account_number.valid?
      session[:account_number] = @atm_account_number.account_number
      redirect_to action: :pin
    end
  end

  def pin
  end

  private

  def validate_account_number
    atm_account_number = Forms::AtmAccountNumber.new(account_number: session[:account_number])
    redirect_to action: :login unless atm_account_number.valid?
    @account_number = atm_account_number.account_number
  end

  def atm_account_number_params
    params.permit(forms_atm_account_number: :account_number)[:forms_atm_account_number] || {}
  end
end
