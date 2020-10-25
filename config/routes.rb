Rails.application.routes.draw do
  devise_for :users, :controllers => {registrations: 'registrations'}
  resources :groups
  resources :books
  resources :users, only: [:show, :index, :community, :reader]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root "users#show"

  get "ungrouped" => "books#ungrouped"

  get "community" => "users#community"

  get "reader/:id", to: 'users#reader', as: :reader

end
