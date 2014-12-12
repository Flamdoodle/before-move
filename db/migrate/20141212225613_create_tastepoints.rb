class CreateTastepoints < ActiveRecord::Migration
  def change
    create_table :tastepoints do |t|
      t.integer :amount
      t.string :earned_by

      t.timestamps
    end
  end
end
