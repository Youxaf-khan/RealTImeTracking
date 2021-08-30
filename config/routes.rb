Rails.application.routes.draw do
  mount Sidekiq::Web => '/sidekiq'

  root 'vehicles#index'


  resources :vehicles
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
