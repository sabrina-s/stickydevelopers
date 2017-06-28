require 'rails_helper'

RSpec.describe Admin::OrdersController, type: :controller do

  let(:user) { create(:user) }
  let(:address) { create(:address, user: user) }
  let(:order) { create(:order, user: user, address: address, status: "New") }

  context 'admin not signed in' do

    before do
      get :edit, params: { id: order.id }
    end

    it { expect(response).to redirect_to new_admin_session_path }

  end

  context 'admin signed in' do

    let(:admin) { create(:admin) }

    before do
      sign_in admin
    end
      
    describe 'GET #edit' do
      
      before do
        get :edit, params: { id: order.id }
      end

      it { expect(assigns(:order)).to eq(order) }

    end
    
    describe 'PATCH #update' do 

      before do
        patch :update, params: { status: order }
      end

      it { expect(assigns(:order)).to eq() }

    end

  end
end