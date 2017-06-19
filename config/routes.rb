Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/pgadmin', as: 'rails_admin'

  devise_for :users
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
