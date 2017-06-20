class CreateOrderItems < ActiveRecord::Migration[5.1]
  def change
    create_table :order_items do |t|
      t.belongs_to :order, foreign_key: true
      t.belongs_to :variation, foreign_key: true
      t.integer :amount

      t.timestamps
    end
  end
end
