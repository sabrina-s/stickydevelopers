class CreateOrders < ActiveRecord::Migration[5.1]
  def change
    create_table :orders do |t|
      t.belongs_to :user, foreign_key: true
      t.belongs_to :address, foreign_key: true
      t.integer :status

      t.timestamps
    end
  end
end
