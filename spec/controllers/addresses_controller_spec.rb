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
      let!(:shipping_addresses){ create_list(:address, 3, add_type: "Shipping", user: user) }
      let!(:billing_addresses){ create_list(:address, 3, add_type: "Billing", user: user) }
      before do
        get :index
      end

      it { expect(response).to have_http_status(:success) }
      it { expect(Address.count).to eq(6) }
      it { expect(assigns(:shipping_addresses)).to match_array(shipping_addresses) }
      it { expect(assigns(:billing_addresses)).to match_array(billing_addresses) }
    end

    describe 'get new' do
      before do
        get :new
      end

      it { expect(assigns(:address)).to be_a_new_record }
    end

    describe 'create' do
      before do
        post :create, params: { address: params }
      end

      context 'If save success' do
        let(:params){ attributes_for(:address) }
        it { expect(assigns(:address)).to have_attributes(params) }
        it { expect(Address.count).to eq(1) }
      end

      context 'If save unsuccessful' do
        let(:params) { attributes_for(:address, :invalid) }
        it { expect(Address.count).to eq(0) }
        it { expect(response).to render_template(:new) }
      end
    end

    describe 'get edit' do
      let(:address) { create(:address, user: user) }

      before do
        get :edit, params: { id: address.id }
      end

      it { expect(assigns(:address)).to eq(address) }
    end

    describe 'patch update' do
      let(:address) { create(:address, user: user) }
      before do
        patch :update, params: { id: address.id, address: params }
      end

      let(:params){ attributes_for(:address, label: "dsadsa") }
      it { expect(Address.last).to have_attributes(params) }
    end

    describe 'delete destroy' do
      let(:addresses) { create_list(:address, 3, user: user) }
      before do
        delete :destroy, params: { id: addresses[2] }
      end
      it { expect(assigns(:address)).to eq(addresses[2]) }
      it { expect(Address.count).to eq(2) }
    end
  end
end
