Rails.application.routes.draw do
  resources :groups
  resources :books
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root "books#index"
end
