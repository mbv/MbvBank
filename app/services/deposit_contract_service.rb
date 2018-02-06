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


  private def create_deposit_account(deposit_contract, params = {})
    account = Account.create({ client:       deposit_contract.client,
                               currency:     deposit_contract.currency,
                               account_type: :deposit,
                               activity:     :passive }.merge(params))
    account.generate_number_and_pin
    account
  end
end