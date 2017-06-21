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

  def remove_item(variation_id)
    item = self.user_cart_items.find_by(variation_id: variation_id)
    return true if item.delete
    false
  end
end
