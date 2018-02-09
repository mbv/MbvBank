# frozen_string_literal: true

class CreditContractService
  def create(client, params)
    credit_contract = CreditContract.new(params)

    credit_contract.client = client

    return credit_contract unless credit_contract.valid?

    credit_contract.amount = credit_contract.amount.to_d
    credit_contract.assign_attributes(current_account: create_deposit_account(credit_contract),
                                      main_account:    create_deposit_account(credit_contract,
                                                                              amount: credit_contract.amount),
                                      start_date:      Time.zone.today,
                                      end_date:        credit_contract.credit.months.month.from_now,
                                      closed:          false)

    TransactionService.new.on_create_deposit_contract(credit_contract, credit_contract.amount)

    credit_contract.save
    credit_contract
  end

  private def create_credit_account(credit_contract, params = {})
    account = Account.create({ client:       credit_contract.client,
                               currency:     credit_contract.credit.currency,
                               account_type: :credit,
                               activity:     :passive,
                               amount:       0,
                               real_amount:  0 }.merge(params))
    account.generate_number_and_pin
    account
  end
end