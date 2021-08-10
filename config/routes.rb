Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root "movies#index"
  resources :movies
  # get "/movies/:id/rent", to: "movies#select_movie_user", as: "select_movie_user"
  # post "/movies/:id/rent", to: "movies#rent", as: "rent_movie"
  # get "/movies/:id/unrent", to: "movies#unrent", as: "return_movie"
  resources :users
  resources :categories
  resources :rents
  # get "/rents", to: "rents#index"
  # post "/rents", to: "rents#create"
  # get "/rents/new/:movie_id", to: "rents#new"
end
