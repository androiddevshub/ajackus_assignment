class CreateContacts < ActiveRecord::Migration[6.1]
  def change
    create_table :contacts do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :phone
      t.string :message
      t.timestamps
    end
    add_index :contacts, :email, unique: true
    add_index :contacts, :phone, unique: true
  end
end
