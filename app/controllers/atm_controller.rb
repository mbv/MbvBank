# frozen_string_literal: true

class AtmController < ApplicationController
  before_action :validate_account_number, except: %i[new_login login]
  before_action :validate_account, only: %i[dashboard deposit_money deposit_withdraw credit_money]

  def new_login
    @atm_account_number = Forms::AtmAccountNumber.new
    render 'login'
  end

  def login
    @atm_account_number = Forms::AtmAccountNumber.new(atm_account_number_params)

    if @atm_account_number.valid?
      session[:atm_account_number] = @atm_account_number.account_number
      redirect_to action: :pin
    end
  end

  def new_pin
    @atm_account_pin = Forms::AtmAccountPin.new
    render 'pin'
  end

  def pin
    @atm_account_pin = Forms::AtmAccountPin.new(atm_account_pin_params)

    if @atm_account_pin.valid?
      session[:atm_account_pin] = @atm_account_pin.pin
      account = AtmService.new.authorize_account(@account_number, @atm_account_pin.pin)
      @atm_account_pin.errors.add(:pin) unless account
      redirect_to action: :dashboard if account
    end
  end

  def dashboard; end

  def deposit_money
    @atm_deposit_withdraw = Forms::AtmDepositWithdraw.new
  end

  def deposit_withdraw
    @atm_deposit_withdraw = Forms::AtmDepositWithdraw.new(atm_deposit_withdraw_params)
    return render 'deposit_money' unless @atm_deposit_withdraw.valid?

    unless AtmService.new.deposit_withdraw(@account, @atm_deposit_withdraw.amount.to_d)
      @atm_deposit_withdraw.errors.add(:amount, 'you don\'t have enough funds in your account')
      return render 'deposit_money'
    end
    clear_pin
  end

  def credit_money

  end

  private

  def validate_account_number
    atm_account_number = Forms::AtmAccountNumber.new(account_number: session[:atm_account_number])
    return redirect_to action: :new_login unless atm_account_number.valid?
    @account_number = atm_account_number.account_number
  end

  def validate_account
    atm_account_number = Forms::AtmAccountNumber.new(account_number: session[:atm_account_number])
    return redirect_to action: :new_login unless atm_account_number.valid?

    atm_account_pin = Forms::AtmAccountPin.new(pin: session[:atm_account_pin])
    return redirect_to action: :new_pin unless atm_account_pin.valid?

    @account = AtmService.new.authorize_account(atm_account_number.account_number, atm_account_pin.pin)

    redirect_to action: :new_login unless @account
  end

  def atm_account_number_params
    params.permit(forms_atm_account_number: :account_number)[:forms_atm_account_number] || {}
  end

  def atm_account_pin_params
    params.permit(forms_atm_account_pin: :pin)[:forms_atm_account_pin] || {}
  end

  def atm_deposit_withdraw_params
    params.permit(forms_atm_deposit_withdraw: :amount)[:forms_atm_deposit_withdraw] || {}
  end

  def clear_pin
    session[:atm_account_pin] = nil
  end
end
