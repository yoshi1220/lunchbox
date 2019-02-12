Rails.application.routes.draw do
  root 'home#index'
  get 'home/index'
  resources :reservations
  namespace :user do
    resources :registrations, only: [:new, :create]
  end
end
