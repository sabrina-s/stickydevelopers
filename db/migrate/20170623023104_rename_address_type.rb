class RenameAddressType < ActiveRecord::Migration[5.1]
  def self.up
    rename_column :addresses, :type, :add_type
  end

  def self.down
    rename_column :addresses, :add_type, :type
  end
end
