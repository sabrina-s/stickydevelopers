class AddUserToAddress < ActiveRecord::Migration[5.1]
  def change
    add_reference :addresses, :user, index: true
  end
end
