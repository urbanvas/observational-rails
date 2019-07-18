Rails.application.routes.draw do
  # everything except seeing all users
  # index/show you'll just redriect them to the edit page
  # in systems/planets you'll show them individual and all as a whole collective outside from observations
  # in observations new/create you'll be able to add planets and systems one time
  # in observations edit/update you'll be able to edit names and delete planets/systems one time
  # in observations destroy you should delete planets/systems one time 

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
