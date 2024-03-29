Rails.application.routes.draw do
  devise_for :users

  root to: 'pages#home'
  get 'properties', to: 'pages#index', as: :properties

  get 'favorites', to: 'users#favorites'

  resources :houses, only: %i[show] do
    member do
      post 'add_favorite', to: 'houses#add_favorite'
      post 'remove_favorite', to: 'houses#remove_favorite'
    end
  end

  resources :apartments, only: %i[show] do
    member do
      post 'add_favorite', to: 'apartments#add_favorite'
      post 'remove_favorite', to: 'apartments#remove_favorite'
    end
  end

  resources :cities, only: %i[] do
    member do
      post 'add_recent_location', to: 'cities#add_recent_location'
    end
  end

  resources :boroughs, only: %i[] do
    member do
      post 'add_recent_location', to: 'boroughs#add_recent_location'
    end
  end

  resources :researches, only: %i[create index]
end
