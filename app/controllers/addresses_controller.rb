class AddressesController < ApplicationController
  before_action :authenticate_user!

  def index
    @shipping_addresses = current_user.addresses.where(add_type: "Shipping")
    @billing_addresses = current_user.addresses.where(add_type: "Billing")
  end

  def new
    @address = current_user.addresses.build
  end

  def create
    @address = current_user.addresses.build(address_params)
    if @address.save
      redirect_to addresses_path
    else
      render :new
    end
  end

  def edit
    @address = current_user.addresses.find(params[:id])
  end

  def update
    @address = current_user.addresses.find(params[:id])
    @address.update(address_params)
    redirect_to addresses_path
  end

  def destroy
    @address = Address.find(params[:id])
    @address.destroy
    redirect_back(fallback_location: addresses_path)
  end

  private

  def address_params
    params.require(:address).permit(:label, :line1, :line2, :zipcode, :contact_person,
                                    :contact_no, :country, :user_id, :add_type)
  end
end
