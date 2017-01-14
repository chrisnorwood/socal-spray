Rails.application.routes.draw do
  post 'user_token' => 'user_token#create'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'application#preflight'
  
  match '*all', to: 'application#preflight', via: [:options]
  resources :puzzles, only: [:index]
  resources :areas, only: [:index]

  resources :users, only: [:index, :create]
  get '/current_user', to: 'users#show_current'
end
