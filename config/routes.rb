# frozen_string_literal: true

Rails.application.routes.draw do
  root 'clients#index'

  resources :clients do
    resources :deposit_contracts
    resources :credit_contracts
  end

  get 'bank/stats', to: 'bank#stats'
  post 'bank/submit_day', to: 'bank#submit_day'

  get 'atm', to: 'atm#new_login'
  post 'atm', to: 'atm#login'
  get 'atm/pin', to: 'atm#new_pin'
  post 'atm/pin', to: 'atm#pin'

  get 'atm/dashboard', to: 'atm#dashboard'
  get 'atm/deposit', to: 'atm#deposit_money'

end
