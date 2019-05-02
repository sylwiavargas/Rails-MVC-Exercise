Rails.application.routes.draw do

  resources :authors
  resources :books, only: [:index, :show]
  resources :queries, only: [:create, :destroy]
end
