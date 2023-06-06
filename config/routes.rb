Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  get "actuality", to: "pages#index"
  resources :workouts, only: %i[index show new create edit update] do
    resources :workout_sets, only: %i[create]
    resources :trainings, only: %i[create]
  end
  resources :sessions, only: %i[new create]

  resources :dashboard, only: %i[index] do
    get "my_workout", to: "dashboard#current_workout"
  end
end
