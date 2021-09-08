Rails.application.routes.draw do
  root 'vehicles#index'

  resource :vehicles, only: :show do
    get :export, defaults:{ format: :csv }
  end
end
