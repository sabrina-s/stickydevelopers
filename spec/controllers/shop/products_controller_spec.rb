require 'rails_helper'

RSpec.describe Shop::ProductsController, type: :controller do

    context 'user not signed in' do
      describe 'GET #index' do
        let(:products) { create_list(:product, 3)}

        before do
          get :index
        end

        it do
          expect(response).to have_http_status(:success)
          expect(assigns(:products)).to match_array(products)
        end
      end

      describe 'GET #show' do
        let(:product) { create(:product) }
        let!(:variation) { create(:variation, product: product) }

        before do
          get :show, params: { slug: product.slug }
        end
        it { expect(response).to have_http_status(:success) }
        it { expect(assigns(:product)).to eq(product) }
        it { expect(assigns(:variation_array)).to eq([["#{variation.label} (qty: #{variation.stock})", variation.id]])}
      end

    end

    context 'user signed in' do
      let(:user) { create(:user) }

      before do
        sign_in user
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
        let(:product) { create(:product) }
        let!(:variation) { create(:variation, product: product) }
        before do
          get :show, params: { slug: product.slug }
        end
        it { expect(response).to have_http_status(:success) }
        it { expect(assigns(:product)).to eq(product) }
        it { expect(assigns(:variation_array)).to eq([["#{variation.label} (qty: #{variation.stock})", variation.id]])}
      end

      describe 'get search' do
        let!(:products) { create_list(:product, 3) }

        before do
          get :search, params: { search: "S" }
        end

        it { expect(assigns(:products)).to match_array(products) }
      end
    end
end
