class UserCart < ApplicationRecord
  belongs_to :user, optional: true
  has_many :user_cart_items

  attr_accessor :variation_id, :amount

  def add_item(variation, amount)
    item = self.user_cart_items.build(variation_id: variation.id, amount: amount)
    return true if item.save
    false
  end

  def update_item(variation_id, amount)
    item = self.user_cart_items.find_by(variation_id: variation_id)
    item.amount = amount
    return true if item.save
    false
  end

  def remove_item(cart_item)
    item = self.user_cart_items.find(cart_item)
    return true if item.delete
    false
  end

  def clear_items
    self.user_cart_items.each do |item|
      item.destroy
    end
  end

  def move_items_to_order(order)
    UserCart.transaction do
      self.user_cart_items.each do |item|
        item.order = order
        item.user_cart_id = nil
        item.save
      end
    end
  end
end
