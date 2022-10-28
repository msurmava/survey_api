Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :researches do
    resources :researchcompanies, only: [:create]
    resources :inquiries do
      resources :questions do
        resources :options
        resources :answers
      end
    end
  end

  resources :companies do 
    resources :employments, only: [:create]
  end
  resources :users
  post "login", to: "authentication#login"
  post "logout", to: "authentication#logout"

  resources :responders, only: [:create]
  post "responder_login", to: "responders#login"
  post "responder_logout", to: "responders#logout"
end
