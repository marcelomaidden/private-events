Rails.application.routes.draw do
  resources :users, only: %i[new create show]
  resources :events, only: %i[new create show index]
end
