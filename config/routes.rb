Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/pgadmin', as: 'rails_admin'

  root 'shop/products#index'

  devise_for :users, :controllers => { registrations: 'registrations', omniauth_callbacks: "users/omniauth_callbacks" }

  resources :addresses
  resource :payments, only: [:new, :create, :show]

  namespace :shop  do
    resources :products, only: [:index, :show], param: :slug do
      collection do
        get 'search'
      end
    end
    resource :cart, only: [:show, :create, :destroy] do
      collection do
        get 'clear_items'
      end
    end
    resources :orders
  end

  devise_for :admins, :controllers => { registrations: 'admins/registrations' }
  namespace :admin do
    resources :products, param: :slug do
      member do
        resources :variations
      end
    end
    resources :orders, except: [:new, :create]
    resource :stats, only: [:show]
  end

  # For Guests
  resources :products, only: [:index, :show]
  resource :cart, except: [:new, :create]



  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html



end
