require 'rails_helper'

RSpec.describe Admin::ProductsController, type: :controller do

  context 'admin not signed in' do

    before do
      get :index
    end

    it do
      expect(response).to redirect_to new_admin_session_path
    end

  end

  context 'admin signed in' do

    let(:admin) { create(:admin) }

    before do
      sign_in admin
    end

    describe 'GET #index' do

        let!(:products) { create_list(:product, 5) }

        before do
          get :index
        end

        it { expect(assigns(:products)).to match_array(products) }

    end

    describe 'GET #show' do

      let!(:product) { create(:product) }

      before do
        get :show, params: { slug: product.slug }
      end

      it { expect(assigns(:product)).to eq(product) }

    end

  end

end
