Rails.application.routes.draw do
  devise_for :users
  #root 'users#show'
  root 'brogs#index'
  resources :brogs do
    resources :comments, only: [:create]
  end
  resources :users, only: [:show]
end
