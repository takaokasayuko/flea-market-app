Rails.application.routes.draw do
  root   "products#index"
  get    "/signup", to: "users#new"
  post   "/signup", to: "users#create"
  get    "/login",  to: "sessions#new"
  post   "/login",  to: "sessions#create"
  delete "/logout", to: "sessions#destroy"
  resources :products, only: [:index, :show]
end
