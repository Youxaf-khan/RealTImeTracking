# Rails.application.routes.draw do
#   root 'vehicles#index'
#   namespace :vehicles do
#     get :export, to: 'vehicles#export', defaults: { format: :csv }
#   end
# end

Rails.application.routes.draw do
  root 'vehicles#index'

  resource :vehicles, only: :show do
    get :export, format: :csv
  end
end
