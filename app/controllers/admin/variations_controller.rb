class Admin::VariationsController < ApplicationController

  def new
    @variation = Variation.new
  end

  def create
    if @variation.save
      redirect_to
    else
      render :new
    end
  end

  def edit

  end

  def update

  end

  def destroy

  end

  private

  def variation_params
    params.require(:variation).permit(:label, :price, :stock)
  end

end
