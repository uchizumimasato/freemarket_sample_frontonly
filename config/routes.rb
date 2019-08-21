Rails.application.routes.draw do
  root to: "items#index"
  resources :sessions, only: [:new, :create, :destroy]
  resources :registrations, only: :new do
    collection do
      get 'first'
      post 'second', 'third', 'forth', 'fifth'
    end
  end
  resources :users, only: [:show] do
    member do
      get "likes", "listings", "in_progress", "completed", "purchase", "purchased"
    end
  end
  resources :items do
    member do
      post "purchase"
    end
  end
end
