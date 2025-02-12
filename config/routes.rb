Rails.application.routes.draw do
  root "books#index"

  resources :books, only: [ :index, :show ] do
    member do
      post "borrow"
      post "return"
    end
  end

  # User routes (assuming users have profiles)
  resources :users, only: [ :show ]

  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"

  resources :users
  resources :books
  resources :borrowings
end
