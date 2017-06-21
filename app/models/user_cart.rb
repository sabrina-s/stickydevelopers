class UserCart < ApplicationRecord
  belongs_to :user
  has_many :user_cart_items

  validates :user, presence: true

  def add_item(variation_id, amount)
    item = self.user_cart_items.build(variation_id: variation_id, amount: amount)
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
