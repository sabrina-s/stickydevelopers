class Admin::ProductsController < ApplicationController
  before_action :authenticate_admin!

  def index
    @products = Product.all
  end

  def show
    @product = Product.find_by(slug: params[:slug])
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)

    if @product.save
      redirect_to admin_products_path
    else
      render :new
    end
  end

  def edit
    @product = Product.find_by(slug: params[:slug])
  end

  def update
    @product = Product.find_by(slug: params[:slug])
    
    if @product.update(product_params)
      redirect_to admin_product_path(slug: @product.slug)
    else
      render :edit
    end
  end

  def destroy
    @product.destroy
  end

  private

  def product_params
    params.require(:product).permit(:name, :description, :slug)
  end

end
