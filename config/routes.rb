Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/pgadmin', as: 'rails_admin'
  devise_for :admins
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  

end
