# frozen_string_literal: true

class DepositContractService
  def create(params)
    deposit_contract = DepositContract.new(params)

    deposit_contract.current_account = create_deposit_account(deposit_contract, amount: params[:amount])
    deposit_contract.main_account    = create_deposit_account(deposit_contract)

    deposit_contract.start_date = Time.zone.today
    deposit_contract.end_date   = deposit_contract.deposit.months.month.from_now

    TransactionService.new.on_create_deposit_contract(deposit_contract, params[:amount])

    deposit_contract.save
    deposit_contract
  end

  def revoke(deposit_contract)
    TransactionService.new.on_revoke_deposit_contract(deposit_contract)

    deposit_contract.current_account.update closed: true
    deposit_contract.main_account.update closed: true

    deposit_contract.update closed: true
  end

  private def create_deposit_account(deposit_contract, params = {})
    account = Account.create({ client:       deposit_contract.client,
                               currency:     deposit_contract.currency,
                               account_type: :deposit,
                               activity:     :passive }.merge(params))
    account.generate_number_and_pin
    account
  end
end