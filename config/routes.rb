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
  resources :course_ratings, only: [:new, :create, :edit, :update, :destroy]
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
  resources :students, only: :show
  resources :teachers, only: [:index, :show, :new, :create]
  resources :teacher_ratings, only: [:new, :create, :edit, :update, :destroy]
  resources :wishes, only: [:index, :create, :destroy] do
    collection { delete 'destroy_all' }
  end
end
