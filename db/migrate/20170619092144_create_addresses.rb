class CreateAddresses < ActiveRecord::Migration[5.1]
  def change
    create_table :addresses do |t|
      t.string :line1
      t.string :line2
      t.string :zipcode
      t.string :country
      t.string :contact_person
      t.string :contact_no
      t.integer :type

      t.timestamps
    end
  end
end
