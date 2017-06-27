class AddColumnLabelToAddress < ActiveRecord::Migration[5.1]
  def change
    add_column :addresses, :label, :string
  end
end
