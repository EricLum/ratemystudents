Rails.application.routes.draw do
  resources :comments
  resources :studentratings
  resources :ratings
  resources :students
  resources :teachers
  get "/signup", to: "teachers#new", as: "signup"
  get "/login", to: "sessions#new"
  get '/signin', to: 'sessions#new'
  post "/sessions", to: "sessions#create"
  delete "/sessions", to: "sessions#destroy"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
