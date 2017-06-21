class Shop::CartsController < ApplicationController
  def create
    @variation = Variation.find(params[:user_cart_item][:variation_id])
    @amount = params[:user_cart_item][:amount]
    if @current_cart.add_item(@variation, @amount)
      redirect_to shop_product_path(slug: @variation.product.slug)
    else
      redirect_to shop_product_path(slug: @variation.product.slug)
      flash[:notice] = "There was an error when adding the item to cart"
    end
  end

  def destroy

  end

  def show
  end
end
