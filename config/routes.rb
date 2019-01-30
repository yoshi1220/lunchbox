Rails.application.routes.draw do
  get 'home/index'

  get 'home_controller/index'

  get 'reservations/new'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
