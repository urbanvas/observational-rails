Rails.application.routes.draw do
  root to: 'sessions#new'
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

  get '/auth/:provider/callback', to: 'sessions#create'

  resources :observations, except: [:index, :show] do
    resources :systems
    resources :planets
    resources :galaxies
  end

  resources :users, only: [:show, :new, :create]
  resources :observations, only: [:index, :show]
  resources :systems, only: [:index, :show, :create, :update, :destroy]
  resources :planets, only: [:index, :show, :create, :update, :destroy]
  resources :galaxies, only: [:index, :show, :create, :update, :destroy]

end
