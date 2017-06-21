class Admin::VariationsController < ApplicationController
  before_action :set_product

  # def index
  #   @variations = Variation.all
  # end

  def new
    @variation = @product.variations.build
  end

  def create
    @variation = @product.variations.build(variation_params)

    if @variation.save
      redirect_to admin_product_path(slug: @product.slug)
    else
      render :new
    end
  end

  def edit
    @variation = Variation.find(params[:id])
  end

  def update
    @variation = Variation.find(params[:id])

    @variation.update(variation_params)
    if @variation.save
      redirect_to admin_product_path(slug: @product.slug)
    else
      render :edit
    end
  end

  def destroy
    @variation = Variation.find(params[:id])
    @variation.destroy
    
    redirect_to admin_product_path(slug: @product.slug)
  end

  private

  def set_product
    @product = Product.find_by(slug: params[:slug])
  end

  def variation_params
    params.require(:variation).permit(:label, :price, :stock)
  end

end
