Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  # mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  root to: "campaigns#index"
  resources :campaigns, only: [:index, :show]
  post 'notification', to: 'notification#create'
  # resources :like, only: [:show, :create, :update]
end
