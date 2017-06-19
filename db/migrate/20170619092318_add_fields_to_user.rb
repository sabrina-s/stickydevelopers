class AddFieldsToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :username, :string, null: false
    add_column :users, :first_name, :string, null: false
    add_column :users, :last_name, :string, null: false
    add_column :users, :birthdate, :date, null: false
    add_column :users, :default_shipping, :integer
    add_column :users, :default_billing, :integer
  end
end
