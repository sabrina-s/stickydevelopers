require 'rails_helper'

RSpec.describe Admin::OrdersController, type: :controller do

  let(:user) { create(:user) }
  let(:address) { create(:address, user: user) }
  let(:order) { create(:order, user: user, address: address, status: "Payment Pending") }
  let(:orders) { create_list(:order, 5, user: user, address: address, status: "Payment Pending") }

  context 'admin not signed in' do

    before do
      get :index, params: { id: order.id }
    end

    it { expect(response).to redirect_to new_admin_session_path }

  end

  context 'admin signed in' do

    let(:admin) { create(:admin) }

    before do
      sign_in admin
    end

    describe 'GET #index' do

      before do
        get :index
      end

      it do
        expect(assigns(:new_orders)).to match_array(orders)
      end

    end

    describe 'PATCH #update' do

      before do
        patch :update, params: { id: order.id, order: params }
      end

      let(:params) { attributes_for(:order, status: "Paid") }
      let(:back) { admin_orders_path }
      before { request.env['HTTP_REFERER'] = back }

      it do
        expect(assigns(:order)).to eq(order)
        expect(Order.find(order.id).status).to eq("Paid")
      end

    end

    describe 'get show' do
      let(:user) { create(:user) }
      let(:address) { create(:address, user: user) }
      let(:order) { create(:order, user: user, address: address) }
      before do
        get :show, params: { id: order.id }
      end

      it { expect(assigns(:order)).to eq(order) }
      it { expect(assigns(:user)).to eq(user) }
    end

  end
end
