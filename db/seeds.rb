# frozen_string_literal: true

currency_byn = Currency.create(code: 'BYN', name: 'Белорусский рубль')
currency_usd = Currency.create(code: 'USD', name: 'Доллар США')
currency_eur = Currency.create(code: 'EUR', name: 'Евро')
currency_rub = Currency.create(code: 'RUB', name: 'Российский рубль')

dt_max = DepositType.create(name: 'Безотзывный депозит «Максимум»', revocable: false)
dt_new_v = DepositType.create(name: 'Отзывный депозит «Новая вершина»', revocable: true)

dt_new = DepositType.create(name: 'Безотзывный депозит «Новый»', revocable: false)
dt_our_feature = DepositType.create(name: 'Безотзывный депозит «Наше будущее»', revocable: false)
dt_great = DepositType.create(name: 'Безотзывный депозит «Отличный»', revocable: false)

dt_profitable = DepositType.create(name: 'Отзывный депозит «Выгодный»', revocable: true)


Deposit.create(deposit_type: dt_max, curerncy: currency_byn, months: 12, rate: 8)

Deposit.create(deposit_type: dt_new_v, curerncy: currency_byn, months: 2, rate: 3)
Deposit.create(deposit_type: dt_new_v, curerncy: currency_byn, months: 3, rate: 4)
Deposit.create(deposit_type: dt_new_v, curerncy: currency_byn, months: 6, rate: 6)
Deposit.create(deposit_type: dt_new_v, curerncy: currency_byn, months: 12, rate: 6.5)
