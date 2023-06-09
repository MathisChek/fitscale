Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  get "actuality", to: "pages#actuality"
  resources :workouts do
    resources :workout_sets, only: %i[create]
    resources :trainings, only: %i[create]
  end

  resources :trainings, only: :destroy

  resources :exercices do
    resources :ratings, only: %i[create update]
  end

  resources :sessions, only: %i[create destroy update], as: :gym_session

  resources :users, only: %i[index] do
    get "my_dashboard", to: "users#my_dashboard"
    get "my_workouts", to: "users#my_workouts"
    get "my_sessions", to: "users#my_sessions"
    get "my_exercises", to: "users#my_exercises"
  end
end
