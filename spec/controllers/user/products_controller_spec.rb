require 'rails_helper'

RSpec.describe User::ProductsController, type: :controller do

    # context 'user not signed in' do
    #
    #   it do
    #     expect(response).to redirect_to root_path
    #   end
    #
    # end

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

          it { expect(assigns(:products)).to match_array(products) }

      end

      describe 'GET #show' do

        let(:product) { create(:product) }

        before do
          get :show, params: { id: product }
        end

        it { expect(assigns(:product)).to eq(product) }

      end

    end

end
