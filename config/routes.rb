Rails.application.routes.draw do
  root to: "pages#home"

  devise_for :users, controllers: { registrations: 'registrations' }
  get "users",          to: "users#show",     as: :user
  get "users/security", to: "users#security", as: :user_security

  resources :arts, only: %i[index show new create] do
    resources :bookings, only: %i[create]
    resources :reviews, only: %i[create]
    resources :steps, only: %i[show update], controller: 'arts/steps'
  end

  resources :categories, only: :show
end
