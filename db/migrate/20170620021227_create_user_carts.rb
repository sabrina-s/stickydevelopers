class CreateUserCarts < ActiveRecord::Migration[5.1]
  def change
    create_table :user_carts do |t|
      t.belongs_to :user, foreign_key: true
      t.string :session

      t.timestamps
    end
  end
end
