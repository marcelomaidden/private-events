Rails.application.routes.draw do
  resources :users, only: %i[new create show]
  get '/sign_in', to: 'users#sign_in'
  resources :events, only: %i[new create show index]
end
