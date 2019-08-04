Rails.application.routes.draw do
  root to: 'sessions#new'
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

  get '/auth/:provider/callback', to: 'sessions#create'

  get '/life', to: 'planets#life'

  resources :users, only: [:show, :new, :create]

  resources :observations
  resources :galaxies

  resources :observations, only: [:show] do
    resources :galaxies, only: [:new]
  end

  # # resources :observations, except: [:index, :show] do
  #   resources :galaxies
  # # end

  # resources :observations, only: [:index, :show]
  # resources :galaxies, only: [:index, :show, :create, :update, :destroy]

end
