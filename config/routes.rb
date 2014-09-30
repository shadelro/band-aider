Rails.application.routes.draw do
  mount Upmin::Engine => '/admin'
  root to: 'visitors#index'
  devise_for :users

  resources :bands, module: :bands, only: [:index, :show] do
    resources :songs, only: [:index, :show]
  end

  resources :users, module: :users, only: :show do
    resources :invitations, only: :index
    resources :bands, only: :index
  end

  resources :invitations, only: [:show, :destroy]
  resources :memberships, only: :create
end
