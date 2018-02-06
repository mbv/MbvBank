# frozen_string_literal: true

class TransactionService
  def on_create_deposit_contract(deposit_contract, amount)
    bank_cashbox_account = Account.find_by(account_type: :bank_cashbox, currency: currency)
    bank_fund_account = Account.find_by(account_type: :bank_development_fund, currency: currency)

    bank_cashbox_account.real_amount += amount # will be saved in transaction
    make_transaction(bank_cashbox_account, deposit_contract.main_account, amount)
    make_transaction(deposit_contract.main_account, bank_fund_account, amount)
  end

  def make_transaction(source_account, destination_account, amount)
    Transaction.create(account: source_account, amount: -amount)
    source_account.real_amount -= amount
    source_account.save

    Transaction.create(account: destination_account, amount: amount)
    destination_account.real_amount += amount
    destination_account.save
  end
end
