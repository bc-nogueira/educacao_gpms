Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations' }
  root to: 'home#index'


  # Routes for logged users
  authenticate :user do
    resources :courses, only: [:new, :create, :edit, :update]
    resources :course_ratings, only: [:new, :create, :edit, :update, :destroy]
    resources :discounts, only: [:index, :new, :create, :destroy]
    resources :lessons, only: [:show, :new, :create, :edit, :update, :destroy]
    resources :notifications, only: [:index, :update, :destroy]
    resources :orders, only: [:show] do
      collection do
        get 'add_course'
        get 'student_orders'
      end
      member do
        delete 'remove_course'
        get 'finalize'
        get 'pay'
      end
    end
    resources :teachers, only: [:new, :create]
    resources :teacher_ratings, only: [:new, :create, :edit, :update, :destroy]
    get 'follow_teacher', to: 'students#follow_teacher'
    get 'unfollow_teacher', to: 'students#unfollow_teacher'
    resources :wishes, only: [:index, :create, :destroy] do
      collection { delete 'destroy_all' }
    end
  end

  # Routes for users that aren't logged
  resources :courses, only: [:index, :show] do
    collection do
      get 'search'
      get 'student_courses'
      get 'teacher_courses'
    end
  end
  resources :home, only: :index
  resources :students, only: [:show]
  resources :teachers, only: [:index, :show]
end
