# frozen_string_literal: true

Rails.application.routes.draw do
  root to: 'home#index'

  # Devise cho User
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations',
    passwords: 'users/passwords',
    confirmations: 'users/confirmations',
    unlocks: 'users/unlocks'
  }

  # Devise cho AdminUser
  devise_for :admin_users, controllers: {
    sessions: 'admin_users/sessions',
    registrations: 'admin_users/registrations',
    passwords: 'admin_users/passwords',
    confirmations: 'admin_users/confirmations',
    unlocks: 'admin_users/unlocks'
  }

  get 'dashboard', to: 'dashboard#index', as: :dashboard
end
