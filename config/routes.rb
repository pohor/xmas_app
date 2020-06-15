Rails.application.routes.draw do
  devise_for :users

  resources :users
  resources :presents

  root to: "home#home"

  resources :occasions do
    resources :gifters
    resources :giftees
  end

  get "/occasions/:id/drawing", to: "occasions#drawing", as: "drawing"
  get "/giftees", to: "giftees#index", as: "giftees"
  get "/user/:id/presents", to: "presents#user_index", as: "user_presents_index"
  get "/giftees/:id/presents", to: "presents#index", as: "giftee_presents"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
