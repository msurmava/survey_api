Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  resources :companies 
  resources :users
  post "login", to: "authentication#login"
  post "logout", to: "authentication#logout"
end
