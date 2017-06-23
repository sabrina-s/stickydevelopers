class Shop::OrdersController < ApplicationController
  before_action :authenticate_user!

  def new
    @order = current_user.orders.build
  end

  def create
    @order = current_user.orders.build(order_params)
    @current_cart.move_items_to_order(@order)
    if @order.save
      redirect_to root_path
    else
      redirect_back(fallback_location: root_path)
      flash[:notice] = "There was a problem saving your order."
    end
  end

  private

  def order_params
    params.require(:order).permit(:address)
  end

end
