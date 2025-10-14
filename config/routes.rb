Rails.application.routes.draw do
  get "sessions/new"
  root "products#index"
  get  "/signup", to: "users#new"
  post "/signup", to: "users#create"
  delete "/logout", to: "session#destroy"
end
