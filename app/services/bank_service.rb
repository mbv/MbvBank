# frozen_string_literal: true

class BankService
  def submit_bank_day
    day_update_deposit_contracts
  end

  private def day_update_deposit_contracts
    DepositContract.where(closed: false).each do |deposit_contract|
      interest_amount = deposit_contract.interest_amount_per_day
      deposit_contract.current_account.amount += interest_amount
      deposit_contract.current_account.save
      DepositContractService.new.revoke(deposit_contract) if deposit_contract.end_date < Time.zone.today
    end
  end
end