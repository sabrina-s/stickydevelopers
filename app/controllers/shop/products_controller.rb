class Shop::ProductsController < ApplicationController
  before_action :authenticate_user!

  def index
    @products = Product.all
  end

  def show
    @product = Product.find_by(slug: params[:slug])
  end

end
