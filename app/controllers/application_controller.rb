class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :setup_cart

  def setup_cart
    unless @current_cart
      @current_cart = current_user.build_user_cart
    else
      @current_cart = current_user.user_cart
    end
  end
end
