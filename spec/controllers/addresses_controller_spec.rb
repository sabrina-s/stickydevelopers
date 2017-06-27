require 'rails_helper'

RSpec.describe AddressesController, type: :controller do
  context 'User not signed in' do
    before do
      get :index
    end

    it { expect(response).to redirect_to new_user_session_path }
  end

  context 'User signed in' do
    let(:user) { create(:user) }

    before do
      sign_in user
    end

    describe 'get index' do
      let(:shipping_addresses){ create_list(:address, 3, add_type: "Shipping") }
      before do
        get :index
      end

      it { expect(response).to have_http_status(:success) }
      it { expect(assigns(:shipping_addresses)).to match_array(shipping_addresses) }
      it { expect(assigns(:billing_addresses)).to match_array(billing_addresses) }
    end

    describe 'get new' do

    end





  end

end
