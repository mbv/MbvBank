# frozen_string_literal: true

Rails.application.routes.draw do
  root 'clients#index'

  resources :clients do
    resources :deposit_contracts
  end

  get 'bank/stats', to: 'bank#stats'
  post 'bank/submit_day', to: 'bank#submit_day'
end
