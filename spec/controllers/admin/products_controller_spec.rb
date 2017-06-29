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
        it { expect(response).to have_http_status(:success) }
        it { expect(assigns(:products)).to match_array(products) }

    end

    describe 'GET #show' do

      let!(:product) { create(:product) }

      before do
        get :show, params: { slug: product.slug }
      end
      it { expect(response).to have_http_status(:success) }
      it { expect(assigns(:product)).to eq(product) }

    end

    describe 'Get #new' do
      before do
        get :new
      end

      it { expect(response).to have_http_status(:success) }
    end

    describe 'post create' do
      before do
        post :create, params: { product_form: { product_attributes: params } }
      end

      context 'passing create' do
        let(:params) { attributes_for(:product) }
        it { expect(Product.count).to eq(1) }
        it { expect(response).to redirect_to admin_products_path }
      end

      context 'failing create' do
        let(:params) { attributes_for(:product, name: nil) }
        it { expect(Product.count).to eq(0) }
        it { expect(response).to render_template(:new) }
      end
    end

    describe 'get edit' do
      let!(:product) { create(:product) }

      before do
        get :edit, params: { slug: product.slug }
      end

      it { expect(response).to have_http_status(:success) }
      it { expect(assigns(:product_form).product).to eq(product) }
    end

    describe 'patch update' do
      let!(:product2) { create(:product) }

      before do
        patch :update, params: { slug: product2.slug, product_form: { product_attributes: params } }
      end

      let(:params) { attributes_for(:product, name: "Hello") }

      it { expect(assigns(:product_form).product).to eq(product2) }
      it { expect(Product.find(product2.id).name).to eq("Hello") }
      #it { expect(response).to redirect_to admin_product_path(slug: product2.slug) }
    end

    describe 'delete destroy' do
      let!(:product3) { create(:product) }
      before do
        delete :destroy, params: { slug: product3.slug }
      end

      it { expect(Product.count).to eq(0) }
      it { expect(response).to redirect_to admin_products_path }
      it { expect(flash[:notice]).to match("Item was successfully deleted")}
    end

  end

end
