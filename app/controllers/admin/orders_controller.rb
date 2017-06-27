class Admin::OrdersController < ApplicationController
  before_action :authenticate_admin!

  def edit
    @product = Product.find_by(slug: params[:slug])
    @order = Order.find(params[:id])
  end

  def update
    @product = Product.find_by(slug: params[:slug])
    @order = Order.find(params[:id])

    if @order.update(update_order_params)
      redirect_back(fallback_location: root_path)
    else
      render :edit
    end
  end

  private

  def update_order_params
    params.require(:order).permit(:status)
  end

end
