Rails.application.routes.draw do
  get 'users/show'
  get 'top/index'
  devise_for :users
  root 'top#index'
  resources :tweets, only: [:index, :new, :create]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
