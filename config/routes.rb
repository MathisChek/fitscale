Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  get "actuality", to: "pages#actuality"
  resources :workouts, only: %i[index show new create edit update] do
    resources :workout_sets, only: %i[create edit update]
    resources :trainings, only: %i[create]
  end
  resources :sessions, only: %i[new create]

  resources :users, only: %i[index] do
    get "my_workouts", to: "users#my_workouts"
    get "my_sessions", to: "users#my_sessions"
    get "my_exercises", to: "users#my_exercises"
  end
end
