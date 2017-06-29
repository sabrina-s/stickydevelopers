class Shop::ProductsController < ApplicationController

  def index
    @products = Product.all
  end

  def show
    @product = Product.find_by(slug: params[:slug])
    @variation_array = 
      @product.variations.map do |variation|
        ["#{variation.label} (qty: #{variation.stock})", variation.id]
      end
  end

  def search
    @search = params[:search]

    if params[:search]
      @products = Product.search(params[:search])
    end
  end

end
