Rails.application.routes.draw do
  get 'arts/index'
  get 'arts/new'
  get 'arts/create'
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  # resources for Art model
  resources :arts, only: %i[index new create]
end
