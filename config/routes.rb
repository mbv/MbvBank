# frozen_string_literal: true

Rails.application.routes.draw do
  resources :deposit_contracts
  resources :clients

  get 'bank/stats', to: 'bank#stats'
  post 'bank/submit_day', to: 'bank#submit_day'
end
