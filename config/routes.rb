Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :researches do
    resources :researchcompanies, only: [:create]
  end

  resources :companies do 
    resources :employments, only: [:create]
  end
  resources :users
  post "login", to: "authentication#login"
  post "logout", to: "authentication#logout"
end
