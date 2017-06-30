require 'rails_helper'

RSpec.describe Order, type: :model do
  it { should belong_to(:user) }
  it { should belong_to(:address) }
  it { should have_many(:user_cart_items) }

  it { should validate_presence_of(:status) }

  describe '.get_total' do
    let(:user) { create(:user) }
    let(:address) { create(:address, user: user) }
    let(:order) { create(:order, user: user, address: address) }
    let(:product) { create(:product) }
    let(:variation) { create(:variation, product: product) }
    let!(:user_cart_item) { create(:user_cart_item, order: order, variation: variation, amount: 4) }

    it 'returns total of order' do
      expect(order.get_total).to eq(4)
    end
  end

  describe 'minus_stock' do
    let(:user) { create(:user) }
    let(:address) { create(:address, user: user) }
    let(:order) { create(:order, user: user, address: address) }
    let(:product) { create(:product) }
    let(:variation) { create(:variation, product: product, stock: 10) }
    let!(:user_cart_item) { create(:user_cart_item, order: order, variation: variation, amount: 4) }

    it 'reduce stock by amount' do
      order.minus_stock
      expect(Variation.find(variation.id).stock).to eq(6)
    end
  end
end
