Rails.application.routes.draw do
  devise_for :users
  root 'tweets#index'
  resources :tweets, only: [:index, :new, :create, :destroy, :show] do
    resources :comments, only: :create
  end
  get 'users/show' # マイページ
end
