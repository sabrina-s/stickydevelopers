class CreateVariations < ActiveRecord::Migration[5.1]
  def change
    create_table :variations do |t|
      t.belongs_to :product, foreign_key: true
      t.string :label
      t.integer :price
      t.integer :stock

      t.timestamps
    end
  end
end
