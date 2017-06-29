class Admin::OrdersController < ApplicationController
  before_action :authenticate_admin!

  # def edit
  #   @product = Product.find_by(slug: params[:slug])
  #   @order = Order.find(params[:id])
  #   render :nothing => true
  # end

  def index
    @new_orders = Order.where(status: "Payment Pending").order('updated_at DESC')
    @paid_orders = Order.where(status: "Paid").order('updated_at DESC')
    @packed_orders = Order.where(status: "Packed").order('updated_at DESC')
    @shipped_orders = Order.where(status: "Shipped").order('updated_at DESC')
  end

  # def edit
    # not needed for now
  # end

  def update
    @order = Order.find(params[:id])

    if @order.update(update_order_params)
      redirect_back(fallback_location: root_path)
    else
      redirect_back(fallback_location: root_path)
      flash[:alert] = 'There was an error changing the order status.'
    end
  end

  def show
    @order = Order.find(params[:id])
    @user = @order.user
    @address = @order.address
  end

  private

  def update_order_params
    params.require(:order).permit(:status)
  end

end
