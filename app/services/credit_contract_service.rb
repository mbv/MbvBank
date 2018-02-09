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

    TransactionService.new(credit_contract.credit.currency)
      .on_create_credit_contract(credit_contract, credit_contract.amount)


    credit_contract.save
    credit_contract
  end

  private

  def create_credit_account(credit_contract, params = {})
    account = Account.create({ client:       credit_contract.client,
                               currency:     credit_contract.credit.currency,
                               account_type: :credit,
                               activity:     :passive,
                               amount:       0,
                               real_amount:  0 }.merge(params))
    account.generate_number_and_pin
    account
  end

  def create_credit_payments(credit_contract)
    if credit_contract.contract_type.annuity?
      #proposed_amount = credit_contract.credit.rate / 1200 * (1 + credit_contract.credit.rate / 1200) ** credit_contract.credit.months / ((1 + credit_contract.credit.rate / 1200) ** credit_contract.credit.months - 1) * credit_contract.main_account.amount
    else
      #proposed_amount = credit_contract.credit.rate / 100 / 365 * (1 + credit_contract.credit.rate / 100) ** (credit_contract.end_date - credit_contract.start_date).days / ((1 + credit_contract.credit.rate / 100) ** (credit_contract.end_date - credit_contract.start_date).days - 1) * credit_contract.main_account.amount
    end
    number_of_months = (credit_contract.end_date.year * 12 + credit_contract.end_date.month) -
      (credit_contract.start_date.year * 12 + credit_contractstart_date.month) - 1
    number_of_months.times do |i|
      (i + 1).months
    end
  end

  def create_credit_payment(date, amount)

  end
end