class Admin::ProductsController < ApplicationController
  before_action :authenticate_admin!

  def index
    @products = Product.all
  end

  def show
    @product = Product.find_by(slug: params[:slug])
    @variations = @product.variations
  end

  def new
    @product_form = ProductForm.new
  end

  def create
    @product_form = ProductForm.new(product_params)

    if @product_form.save
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
    @product = Product.find_by(slug: params[:slug])
    @product.destroy

    redirect_to admin_products_path, notice: 'Item was successfully deleted.'
  end

  private

  def product_params
    params.require(:product_form).permit(product_attributes: [:name, :description, :slug, :photo])
  end

end
