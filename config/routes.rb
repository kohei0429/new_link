Rails.application.routes.draw do
  get 'users/show' # マイページ
  get 'tweets/index'
  devise_for :users
  root 'tweets#index'
  resources :tweets, only: [:index, :new, :create, :destroy, :show]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
