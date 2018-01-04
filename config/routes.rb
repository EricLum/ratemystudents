Rails.application.routes.draw do
  resources :likes
  resources :comments
  resources :studentratings
  resources :ratings
  resources :students
  resources :teachers
  root to: 'teachers#show'
  get "/signup", to: "teachers#new", as: "signup"
  get "/login", to: "sessions#new"
  get '/signin', to: 'sessions#new'
  post "/sessions", to: "sessions#create"
  delete "/sessions", to: "sessions#destroy"
  get '/analytics', to: 'students#analytics', as: 'analytics'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
