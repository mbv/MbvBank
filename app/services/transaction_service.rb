# frozen_string_literal: true

class TransactionService
  def initialize(currency = nil)
    @currency = currency
  end

  def on_create_deposit_contract(deposit_contract, amount)
    bank_cashbox_account.real_amount += amount # will be saved in transaction, imitation of depositing money
    make_transaction(bank_cashbox_account, deposit_contract.main_account, amount)
    make_transaction(deposit_contract.main_account, bank_fund_account, amount)
  end

  def on_create_credit_contract(credit_contract, amount)
    make_transaction(bank_fund_account, credit_contract.main_account, amount)
    make_transaction(credit_contract.main_account, bank_cashbox_account, amount)

    bank_cashbox_account.real_amount -= amount
    bank_cashbox_account.save
  end

  def on_revoke_deposit_contract(deposit_contract)
    deposit_amount = deposit_contract.main_account.amount
    make_transaction(bank_fund_account, deposit_contract.main_account, deposit_amount)
    make_transaction(deposit_contract.main_account, bank_cashbox_account, deposit_amount)

    interest_amount = deposit_contract.current_account.amount
    make_transaction(bank_fund_account, deposit_contract.current_account, interest_amount)
    make_transaction(deposit_contract.current_account, bank_cashbox_account, interest_amount)

    bank_cashbox_account.update real_amount: 0 # clear cashbox, imitation of money withdrawal
  end

  def make_transaction(source_account, destination_account, amount)
    Transaction.create(account: source_account, amount: -amount)
    source_account.real_amount -= amount
    source_account.save

    Transaction.create(account: destination_account, amount: amount)
    destination_account.real_amount += amount
    destination_account.save
  end

  private

  def bank_cashbox_account
    @bank_cashbox_account ||= Account.find_by(account_type: :bank_cashbox,
                                              currency:     @currency)
  end

  def bank_fund_account
    @bank_fund_account ||= Account.find_by(account_type: :bank_development_fund,
                                           currency:     @currency)
  end
end
