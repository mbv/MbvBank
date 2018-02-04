# frozen_string_literal: true

Rails.application.routes.draw do
  resources :deposit_contracts
  resources :clients
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
