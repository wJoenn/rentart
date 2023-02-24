Rails.application.routes.draw do
  root to: "pages#home"

  devise_for :users, controllers: { registrations: 'registrations' }
  get "users",          to: "users#show",     as: :user
  get "users/security", to: "users#security", as: :user_security

  resources :arts, only: %i[index show new create] do
    resources :bookings, only: %i[create]
  end

  resources :categories, only: :show
end
