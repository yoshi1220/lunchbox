Rails.application.routes.draw do
  root 'home#index'
  get 'home/index'
  resources :reservations
  # 認証関連
  get 'sign_in' => 'user/sessions#new'
  delete 'sign_out' => 'user/sessions#destroy'
  namespace :user do
    resources :registrations, only: [:new, :create]
    resources :sessions, only: :create
  end
end
