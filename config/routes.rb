Rails.application.routes.draw do
  resources :likes, only: [:new, :create, :destroy]
  resources :comments
  resources :ratings
  resources :students, only: [:new, :create, :show, :destroy,:analytics, :update, :edit]
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
