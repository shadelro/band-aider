Rails.application.routes.draw do
  mount Upmin::Engine => '/admin'
  root to: 'visitors#index'
  devise_for :users

  resources :bands, only: [:index, :show]
  resources :users, only: :show do
    resources :invitations, only: [:index, :show]
    resources :bands, only: :index
  end
  resources :invitations, only: :destroy
  resources :memberships, only: :create
end
