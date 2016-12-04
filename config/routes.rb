Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'application#preflight'
  
  match '*all', to: 'application#preflight', via: [:options]
  resources :puzzles, only: [:index]
end
