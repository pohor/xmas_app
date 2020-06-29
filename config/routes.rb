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
  post "/presents/:id/assign_gifter_to_present", to: "presents#assign_gifter_to_present", as: "assign_gifter_to_present"
  post "/presents/:id/remove_gifter_from_present", to: "presents#remove_gifter_from_present", as: "remove_gifter_from_present"
  post "/validate_link", to: "validations#validate_link"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
