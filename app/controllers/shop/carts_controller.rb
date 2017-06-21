class CartsController < ApplicationController
  def create
    @product = Product.find_by(slug: params[:slug])
    @variation = params[:variation]
    @amount = params[:amount]
    @current_cart.add_item(@variation, @amount)
  end

  def destroy

  end

  def show

  end
end
