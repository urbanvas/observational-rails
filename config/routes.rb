Rails.application.routes.draw do
  # resources :systems
  # resources :planets
  # resources :observations
  # resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, except: [:index]
  resources :observations, only: [:index, :show]
  resources :systems, only: [:index, :show]
  resources :planets, only: [:index, :show]

  resources :observations, except: [:index, :show] do
    resources :systems
    resources :planets
  end
end
