Rails.application.routes.draw do
  root 'items#index'

  namespace :api do
    namespace :v1 do
      resources :items, only: [:show,:destroy, :create]
    end
  end
  resources :search, only: [:index]
  # get '/search', to: 'search#index', as: 'search_path'
  resources :items, only: [:index, :show]
  resources :orders, only: [:index, :show]
  resources :users, only: [:index, :show]
end
