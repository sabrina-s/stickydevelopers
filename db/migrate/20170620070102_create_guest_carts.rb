class CreateGuestCarts < ActiveRecord::Migration[5.1]
  def change
    create_table :guest_carts do |t|
      t.string :session

      t.timestamps
    end
  end
end
