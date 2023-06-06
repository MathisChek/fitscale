Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :workouts, only: %i[index show new create edit update] do
    resources :workout_sets, only: %i[create edit update]
    resources :trainingss, only: %i[create]
  end
  resources :sessions, only: %i[new create]
end
