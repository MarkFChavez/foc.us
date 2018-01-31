Rails.application.routes.draw do
  devise_for :users

  root "dashboard#index"

  resource :calendar, only: [:show]

  resources :events, only: [:new, :create]
  resources :notes, only: [:new, :create, :edit, :update, :destroy]
  resources :todos, only: [:new, :create, :edit, :update, :destroy]
end
