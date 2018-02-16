# frozen_string_literal: true

class DepositContractService
  def create(client, params)
    deposit_contract = DepositContract.new(params)

    deposit_contract.client = client

    return deposit_contract unless deposit_contract.valid?

    deposit_contract.amount = deposit_contract.amount.to_d
    deposit_contract.assign_attributes(current_account: create_deposit_account(deposit_contract),
                                       main_account: create_deposit_account(deposit_contract,
                                                                            amount: deposit_contract.amount),
                                       start_date: Time.zone.today,
                                       end_date: deposit_contract.deposit.months.month.from_now,
                                       closed: false)

    TransactionService.new(deposit_contract.deposit.currency)
      .on_create_deposit_contract(deposit_contract, deposit_contract.amount)

    deposit_contract.save
    deposit_contract
  end

  def revoke(deposit_contract)
    TransactionService.new(deposit_contract.deposit.currency)
      .on_revoke_deposit_contract(deposit_contract)

    deposit_contract.current_account.update closed: true
    deposit_contract.main_account.update closed: true

    deposit_contract.update closed: true
  end

  def withdraw(account, amount)
    account.amount -= amount
    account.save

    deposit_contract = account.contract
    TransactionService.new(deposit_contract.deposit.currency)
      .on_withdraw_deposit_contract(deposit_contract, amount)
    true
  end

  private def create_deposit_account(deposit_contract, params = {})
    account = Account.create({ client:       deposit_contract.client,
                               currency:     deposit_contract.deposit.currency,
                               account_type: :deposit,
                               activity:     :passive,
                               amount:       0,
                               real_amount:  0,
                               closed: false }.merge(params))
    account.generate_number_and_pin
    account
  end
end