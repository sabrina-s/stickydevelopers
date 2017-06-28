class Shop::OrdersController < ApplicationController
  before_action :authenticate_user!

  def new
    @order = current_user.orders.build
  end

  def create
    @user = current_user
    @order = current_user.orders.build(order_params)
    @order.status = 1
    if Order.transaction do
      @order.save
      @current_cart.move_items_to_order(@order)
      OrderMailer.order_summary_email(@user, @order).deliver_now
      end
      redirect_to root_path
    else
      redirect_back(fallback_location: root_path)
      flash[:notice] = "There was a problem saving your order."
    end
  end

  private

  def order_params
    params.require(:order).permit(:address_id)
  end

end
