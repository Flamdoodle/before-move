class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.string :name
      t.string :title
      t.string :email
      t.string :phone_number
      t.boolean :is_primary

      t.timestamps
    end
  end
end
