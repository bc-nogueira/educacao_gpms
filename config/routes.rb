Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations' }
  root to: 'home#index'

  resources :home, only: :index
  resources :courses, only: :index
end
