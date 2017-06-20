class CreateUserCartItems < ActiveRecord::Migration[5.1]
  def change
    create_table :user_cart_items do |t|
      t.belongs_to :user_cart, foreign_key: true
      t.belongs_to :variation, foreign_key: true

      t.timestamps
    end
  end
end
