Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/pgadmin', as: 'rails_admin'

  root 'products#index'

  devise_for :users, :controllers => { registrations: 'registrations', omniauth_callbacks: "users/omniauth_callbacks" }

  namespace :user do
    resources :products, only: [:index, :show]
    resource :cart, except: [:new, :create]
    resources :orders
  end

  devise_for :admins
  namespace :admin do
    resources :products
  end

  # For Guests
  resources :products, only: [:index, :show]
  resource :cart, except: [:new, :create]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html



end
