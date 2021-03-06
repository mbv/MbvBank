# frozen_string_literal: true

currency_byn = Currency.create(code: 'BYN', name: 'Белорусский рубль')
currency_usd = Currency.create(code: 'USD', name: 'Доллар США')
currency_eur = Currency.create(code: 'EUR', name: 'Евро')
currency_rub = Currency.create(code: 'RUB', name: 'Российский рубль')

[currency_byn, currency_usd, currency_eur, currency_rub].each do |currency|
Account.create(currency:     currency,
               account_type: :bank_cashbox,
               activity:     :active,
               number: "#{Account::ACCOUNT_NUMBER_PREFIX[:bank_cashbox]}000000001",
               name: "Касса #{currency.code.upcase}")

Account.create(currency:     currency,
               account_type: :bank_development_fund,
               activity:     :passive,
               number: "#{Account::ACCOUNT_NUMBER_PREFIX[:bank_development_fund]}000000001",
               name: "Фонд развития банка #{currency.code.upcase}",
               real_amount: 100_000)
end

# https://tb.by/individuals/deposits-savings/deposits/
dt_max = DepositType.create(name: 'Безотзывный депозит «Максимум»', revocable: false)

dt_new = DepositType.create(name: 'Безотзывный депозит «Новый»', revocable: false)
dt_our_feature = DepositType.create(name: 'Безотзывный депозит «Наше будущее»', revocable: false)
dt_great = DepositType.create(name: 'Безотзывный депозит «Отличный»', revocable: false)

dt_new_v = DepositType.create(name: 'Отзывный депозит «Новая вершина»', revocable: true)
dt_profitable = DepositType.create(name: 'Отзывный депозит «Выгодный»', revocable: true)


Deposit.create(deposit_type: dt_max, currency: currency_byn, months: 12, rate: 8)

Deposit.create(deposit_type: dt_new_v, currency: currency_byn, months: 2, rate: 3)
Deposit.create(deposit_type: dt_new_v, currency: currency_byn, months: 3, rate: 4)
Deposit.create(deposit_type: dt_new_v, currency: currency_byn, months: 6, rate: 6)
Deposit.create(deposit_type: dt_new_v, currency: currency_byn, months: 12, rate: 6.5)

Deposit.create(deposit_type: dt_new, currency: currency_usd, months: 24, rate: 1.6)
Deposit.create(deposit_type: dt_our_feature, currency: currency_usd, months: 60, rate: 2.4)
Deposit.create(deposit_type: dt_great, currency: currency_usd, months: 12, rate: 1.1)

Deposit.create(deposit_type: dt_new_v, currency: currency_usd, months: 1, rate: 0.3)
Deposit.create(deposit_type: dt_new_v, currency: currency_usd, months: 3, rate: 0.5)
Deposit.create(deposit_type: dt_new_v, currency: currency_usd, months: 6, rate: 1)
Deposit.create(deposit_type: dt_new_v, currency: currency_usd, months: 12, rate: 1)


Deposit.create(deposit_type: dt_new, currency: currency_eur, months: 24, rate: 1)
Deposit.create(deposit_type: dt_our_feature, currency: currency_eur, months: 60, rate: 1.7)
Deposit.create(deposit_type: dt_great, currency: currency_eur, months: 12, rate: 0.6)

Deposit.create(deposit_type: dt_new_v, currency: currency_eur, months: 1, rate: 0.1)
Deposit.create(deposit_type: dt_new_v, currency: currency_eur, months: 3, rate: 0.2)
Deposit.create(deposit_type: dt_new_v, currency: currency_eur, months: 6, rate: 0.5)
Deposit.create(deposit_type: dt_new_v, currency: currency_eur, months: 12, rate: 0.5)


Deposit.create(deposit_type: dt_new_v, currency: currency_rub, months: 2, rate: 4)
Deposit.create(deposit_type: dt_new_v, currency: currency_rub, months: 3, rate: 4.5)
Deposit.create(deposit_type: dt_new_v, currency: currency_rub, months: 6, rate: 5)
Deposit.create(deposit_type: dt_new_v, currency: currency_rub, months: 12, rate: 5)

Deposit.create(deposit_type: dt_profitable, currency: currency_rub, months: 2, rate: 4)

# https://tb.by/individuals/crediting/cash-loans/
ct_half_year = CreditType.create(name: 'Обыкновенный кредит "На полгода"')
ct_lite = CreditType.create(name: 'Обыкновенный кредит «Лайт»')
ct_simple = CreditType.create(name: 'Обыкновенный кредит')

Credit.create(credit_type: ct_half_year, currency: currency_byn, months: 6, rate: 11.9)

Credit.create(credit_type: ct_lite, currency: currency_byn, months: 12, rate: 12.9)

Credit.create(credit_type: ct_simple, currency: currency_byn, months: 24, rate: 15.5)
Credit.create(credit_type: ct_simple, currency: currency_byn, months: 48, rate: 15.5)
