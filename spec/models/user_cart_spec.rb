require 'rails_helper'

RSpec.describe UserCart, type: :model do
  it { should belong_to(:user) }

  context 'test with this set of data' do
    # Set up database
    let(:user) { create(:user) }
    let(:address) { create(:address, user: user) }
    let(:order) { create(:order, user: user, address: address) }
    let(:user_cart) { create(:user_cart, user: user) }
    let(:product) { create(:product) }
    let(:variation) { create(:variation, product: product) }
    let(:variation2) { create(:variation, product: product, label: "S") }
    let!(:user_cart_item) { create(:user_cart_item, user_cart: user_cart, variation: variation, amount: 4) }

    describe '.add_item' do
      context 'same item' do
        it 'update amount to same item on cart' do
          user_cart.add_item(variation, 2)
          expect(UserCartItem.find(user_cart_item.id).amount).to eq(6)
        end
      end

      context 'different item' do
        it 'add new item to cart' do
          user_cart.add_item(variation2, 2)
          expect(UserCartItem.last).to have_attributes(variation_id: variation2.id)
        end
      end
    end

    describe '.update_item' do
      it 'update item with amount' do
        user_cart.update_item(variation, 2)
        expect(UserCartItem.find(user_cart_item.id).amount).to eq(2)
      end
    end

    describe '.remove_item' do
      it 'remove item from cart' do
        user_cart.remove_item(user_cart_item.id)
        expect(user_cart.user_cart_items.count).to eq(0)
      end
      it 'fails to remove item from cart' do
        item = double
        allow(item).to receive(:find).and_return(item)
        allow(item).to receive(:destroy).and_return(true)
      end
    end

    describe '.clear_items' do
      it 'clears item form cart' do
        user_cart.clear_items
        expect(UserCart.find(user_cart.id).user_cart_items.count).to eq(0)
      end
    end

    describe '.move_items_to_order' do
      it 'moves items from cart to order' do
        user_cart.move_items_to_order(order)
        expect(UserCartItem.find(user_cart_item.id).order.id).to eq(order.id)
      end
    end
  end
end
