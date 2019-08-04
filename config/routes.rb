Rails.application.routes.draw do
  root to: 'sessions#new'
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

  get '/auth/:provider/callback', to: 'sessions#create'

  get '/life', to: 'planets#life'

  resources :users, only: [:show, :new, :create]

  resources :observations
  resources :galaxies, except: [:new]

  resources :observations, only: [:show] do
    resources :galaxies, only: [:new]
  end
end
