Rails.application.routes.draw do
  devise_for :users
  root 'tweets#index'
  resources :tweets, only: [:index, :new, :create, :destroy, :show]
  get 'users/show' # マイページ
  resources :tweets, only: [:index, :new, :create, :destroy, :show]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
