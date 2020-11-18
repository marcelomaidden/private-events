Rails.application.routes.draw do
  resources :users, only: %i[new create show]
  get '/sign_in', to: 'users#sign_in'
  get '/sign_out', to: 'users#sign_out'
  resources :events, only: %i[new create show index]
end
