Rails.application.routes.draw do
  mount Upmin::Engine => '/admin'
  root to: 'bands/bands#index'
  devise_for :users, controllers: { omniauth_callbacks: "users/omniauth_callbacks" }

  resources :bands, module: :bands, only: [:index, :show] do
    resources :songs
    resources :users, only: :show
  end

  resources :users, module: :users, only: :show do
    resources :invitations, only: :index
    resources :bands, only: :index
  end

  resources :invitations, only: [:show, :destroy]
  resources :memberships, only: [:create, :destroy]
  resources :tracks, only: [:create, :destroy]
end
