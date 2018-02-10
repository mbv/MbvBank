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

  private def day_update_credit_contracts
    CreditContract.joins(:next_payment, :current_account).where(closed: false)
      .where('credit_payments.date >= ?', Date.today).each do |credit_contract|
      credit_contract.main_account.amount += credit_contract.main_account.amount * credit_contract.credit.rate_per_month
      if credit_contract.current_account.amount < credit_contract.next_payment.amount
        credit_contract.main_account.amount += 10
      else
        TransactionService.new(credit_contract.credit.currency)

      end
    end

  end
end
