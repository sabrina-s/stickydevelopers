class CreateGuestCartItems < ActiveRecord::Migration[5.1]
  def change
    create_table :guest_cart_items do |t|
      t.belongs_to :guest_cart, foreign_key: true
      t.belongs_to :variation, foreign_key: true
      t.integer :amount
      t.timestamps
    end
  end
end
