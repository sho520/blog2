Rails.application.routes.draw do
  devise_for :users
  root 'blogtop#index'
  resources :blogtop
  resources :users
end
