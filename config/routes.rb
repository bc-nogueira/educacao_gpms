Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations' }
  root to: 'home#index'

  resources :courses, only: [:index, :show, :new, :create] do
    collection do
      get 'search'
      get 'student_courses'
      get 'teacher_courses'
    end
  end
  resources :home, only: :index
  resources :orders, only: [:show] do
    collection do
      get 'student_orders'
    end
    member do
      delete 'remove_course'
      get 'add_course'
      get 'finalize'
      get 'pay'
    end
  end
  resources :teachers, only: [:index, :show, :new, :create]
end
