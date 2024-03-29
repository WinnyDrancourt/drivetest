Rails.application.routes.draw do
  namespace :admin do
    resources :destinations
    resources :itineraries
    resources :likes
    resources :users

    root to: 'users#index'
  end
  root 'home#index'
  devise_for :users, controllers: { registrations: 'users/registrations' }
  devise_scope :user do
    get '/users/sign_out', to: 'devise/sessions#destroy'
  end

  resources :users
  resources :destinations
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  resources :itineraries do
    resources :destinations
  end

  resources :likes, only: %i[create destroy show]

  resources :about_us
  # Defines the root path route ("/")
  # root "posts#index"
end
