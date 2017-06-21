class Admin::VariationsController < ApplicationController

  # def index
  #   @variations = Variation.all
  # end

  def new
    @variation = Variation.new
  end

  def create
    @variation = Variation.new(variation_params)

    if @variation.save
      redirect_to admin_product_path(slug: @product.slug)
    else
      render :new
    end
  end

  def edit
    @variation = Variation.find(params[:id])
    @product = Product.find_by(slug: params[:slug])
  end

  def update
    @product = Product.find_by(slug: params[:slug])
    @variation = Variation.find(params[:id])

    @variation.update(variation_params)
    if @variation.save
      redirect_to admin_product_path(slug: @product.slug)
    else
      render :edit
    end
  end

  def destroy
    @variation.destroy
  end

  private

  def variation_params
    params.require(:variation).permit(:label, :price, :stock)
  end

end
