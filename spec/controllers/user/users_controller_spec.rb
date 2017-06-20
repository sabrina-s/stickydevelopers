require 'rails_helper'

RSpec.describe User::UsersController, type: :controller do

  describe 'GET #show' do

    let(:user) { create(:user) }

    before do
      sign_in user
      get :show, params: { user: current_user.id }
    end

    it { expect(assigns(:user)). to eq(user) }

  end

end
