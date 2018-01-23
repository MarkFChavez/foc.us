Rails.application.routes.draw do
  devise_for :users

  root "dashboard#index"

  resources :notes, only: [:new, :create, :destroy]
  resources :todos, only: [:new, :create]
end
