Rails.application.routes.draw do
  root to: "pages#home"

  devise_for :users, controllers: { registrations: 'registrations' }
  get "users",          to: "users#show",     as: :user
  get "users/security", to: "users#security", as: :user_security
  get "users/bookings", to: "users#bookings", as: :user_bookings
  get "users/listings", to: "users#listings", as: :user_listings

  resources :arts, only: %i[index show delete] do
    resources :bookings, only: %i[create]
    resources :reviews, only: %i[create]
    resources :build, only: %i[show update create], controller: 'arts/build'
  end

  resources :categories, only: :show
end
