Rails.application.routes.draw do
  mount Upmin::Engine => '/admin'
  root to: 'visitors#index'
  devise_for :users, controllers: { omniauth_callbacks: "users/omniauth_callbacks" }

  resources :bands, only: [:index, :show]
  resources :users, only: :show
end
