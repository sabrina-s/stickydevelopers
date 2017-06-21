class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :set_cart

  def set_cart
    if user_signed_in?
      # Check if cart exists, otherwise creates it
      if current_user.user_cart.nil?
        current_user.create_user_cart
      end
      if UserCart.exists?(session['cart_id'])
        # User is signed in, and current cart not nil, add current_cart to user_cart
        guest_cart = UserCart.find(session['cart_id'])
        if guest_cart.user_cart_items.present?
          # Copy cart contents over
          guest_cart.user_cart_items.each do |item|
            item.user_cart_id = current_user.user_cart.id
            item.save
          end
        end
        guest_cart.destroy
      end
      @current_cart = current_user.user_cart
    else
      # Not signed in
      if UserCart.exists?(session['cart_id'])
        @current_cart = UserCart.find(session['cart_id'])
      else
        @current_cart = UserCart.create
        session['cart_id'] = @current_cart.id
      end
    end
  end
end
