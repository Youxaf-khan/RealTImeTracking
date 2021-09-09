Rails.application.routes.draw do
  root 'vehicles#show'

  resource :vehicles, only: :show do
    get :export
  end
end
