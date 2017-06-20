require 'rails_helper'

RSpec.describe Admin::ProductsController, type: :controller do

  context 'admin not signed in' do

    it do
      expect(response).to redirect_to root_path
      expect(flash[:alert]).to match(/You are not authorised. Please sign in./)
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

  end

end
