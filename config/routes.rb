Rails.application.routes.draw do
  devise_for :users, :controllers => {registrations: 'registrations'}
  resources :groups
  resources :books
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root "users#show"
end
