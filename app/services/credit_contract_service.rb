# frozen_string_literal: true

class CreditContractService
  def create(client, params)
    credit_contract = CreditContract.new(params)

    credit_contract.client = client

    return credit_contract unless credit_contract.valid?

    credit_contract.amount = credit_contract.amount.to_d
    credit_contract.assign_attributes(current_account: create_credit_account(credit_contract),
                                      main_account:    create_credit_account(credit_contract,
                                                                             amount: credit_contract.amount),
                                      start_date:      Time.zone.today,
                                      end_date:        credit_contract.credit.months.month.from_now,
                                      closed:          false)

    TransactionService.new(credit_contract.credit.currency)
      .on_create_credit_contract(credit_contract, credit_contract.amount)

    create_credit_payments(credit_contract)

    credit_contract.save
    credit_contract
  end

  def pay(credit_payment)
    return false if credit_payment.paid
    TransactionService.new(credit_payment.credit_contract.credit.currency)
      .on_credit_payment_paid(credit_payment)

    credit_payment.update paid: true

    next_payment = credit_payment.credit_contract.credit_payments.where(paid: false).order(:date).first
    credit_payment.credit_contract.update_attributes next_payment: next_payment
    true
  end

  private

  def create_credit_account(credit_contract, params = {})
    account = Account.create({ client:       credit_contract.client,
                               currency:     credit_contract.credit.currency,
                               account_type: :credit,
                               activity:     :passive,
                               amount:       0,
                               real_amount:  0,
                               closed: false }.merge(params))
    account.generate_number_and_pin
    account
  end

  def create_credit_payments(credit_contract)
    proposed_amount = credit_contract.month_amount

    next_payment_date = Date.new(credit_contract.start_date.year, credit_contract.start_date.month + 1, 25)

    (credit_contract.credit.months - 1).times do
      credit_payment = CreditPayment.create(credit_contract: credit_contract,
                                            date:            next_payment_date,
                                            amount:          proposed_amount)
      credit_contract.next_payment ||= credit_payment
      next_payment_date += 1.month
    end
    last_amount                  = credit_contract.annuity? ? proposed_amount : credit_contract.main_account.amount
    credit_payment               = CreditPayment.create(credit_contract: credit_contract,
                                                        date:            credit_contract.end_date,
                                                        amount:          last_amount)
    credit_contract.next_payment ||= credit_payment
  end
end
