Rails.application.routes.draw do
  devise_for :users

  root "dashboard#index"

  resources :notes, only: [:new, :create, :edit, :update, :destroy]
  resources :todos, only: [:new, :create, :edit, :update, :destroy]
end
