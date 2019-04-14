Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations' }
  root to: 'home#index'

  resources :courses, only: [:index, :new, :create]
  resources :home, only: :index
  resources :teachers, only: [:index, :new, :create]
end
