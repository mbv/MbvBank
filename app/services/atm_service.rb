# frozen_string_literal: true

class AtmService
  def authorize_account(account_number, pin)
    account = Account.find_by(number: account_number, pin: pin, closed: false)
    return false unless account
    return false if account.deposit? && account.current?
    return false if account.credit? && account.main?
    account
  end
end