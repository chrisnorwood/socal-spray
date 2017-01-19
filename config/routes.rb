Rails.application.routes.draw do

  root 'application#preflight'

  match '*all', to: 'application#preflight', via: [:options]

  post 'user_token' => 'user_token#create'
  resources :users, only: [:index, :create]
  get '/current_user', to: 'users#show_current'

  resources :areas, only: [:index, :show] do
    resources :climbs, only: [:index]
  end

  

end