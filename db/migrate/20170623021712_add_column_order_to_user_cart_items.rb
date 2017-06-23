class AddColumnOrderToUserCartItems < ActiveRecord::Migration[5.1]
  def change
    add_reference :user_cart_items, :order, foreign_key: true, index: true
  end
end
