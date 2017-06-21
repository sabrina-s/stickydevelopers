class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :setup_cart

  def setup_cart
    if current_user
      unless @current_cart
        if current_user.user_cart
          @current_cart = current_user.user_cart
        else
          @current_cart = current_user.build_user_cart
          @current_cart.save
        end
      end
    end
  end
end
