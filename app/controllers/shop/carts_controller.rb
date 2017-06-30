class Shop::CartsController < ApplicationController
  def create
    @variation = Variation.find(params[:user_cart_item][:variation_id])
    @amount = params[:user_cart_item][:amount]
    if @amount.to_i <= @variation.stock
      if @current_cart.add_item(@variation, @amount)
        redirect_to shop_product_path(slug: @variation.product.slug)
      else
        redirect_to shop_product_path(slug: @variation.product.slug)
        flash[:notice] = "There was an error when adding the item to cart"
      end
    else
        redirect_to shop_product_path(slug: @variation.product.slug)
        flash[:notice] = "Sorry, the item is out of stock."     
    end
  end

  def destroy
    @item = params[:item]
    if @current_cart.remove_item(@item)
      redirect_back(fallback_location: root_path)
    else
      redirect_back(fallback_location: root_path)
      flash[:notice] = "There was a problem removing the item from cart"
    end
  end

  def show
  end

  def clear_items
    if @current_cart.clear_items
      redirect_back(fallback_location: root_path)
    else
      redirect_back(fallback_location: root_path)
      flash[:notice] = "There was a problem clearing items from the cart. Please try again"
    end
  end
end
