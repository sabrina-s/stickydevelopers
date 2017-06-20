class AddSlugToProduct < ActiveRecord::Migration[5.1]
  def change
    add_column :products, :slug, :string, null: false
    add_index :products, :slug
  end
end
