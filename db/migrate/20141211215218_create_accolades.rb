class CreateAccolades < ActiveRecord::Migration
  def change
    create_table :accolades do |t|
      t.belongs_to :restaurant
      t.string :name

      t.timestamps
    end
  end
end
