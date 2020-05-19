Rails.application.routes.draw do
  devise_for :users

  resources :users
  resources :presents

  root to: "home#home"

  resources :occasions

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
