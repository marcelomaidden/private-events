Rails.application.routes.draw do
  root to: 'events#index'
  get 'attendances/create'
  resources :users, only: %i[new create show]
  get '/sign_in', to: 'users#sign_in'
  post '/sign_in', to: 'users#sign_in_new'
  get '/sign_out', to: 'users#sign_out'
  resources :events, only: %i[new create show index]
  resources :attendances
end
