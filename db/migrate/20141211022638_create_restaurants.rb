class CreateRestaurants < ActiveRecord::Migration
  def change
    create_table :restaurants do |t|
      t.string :name
      t.string :address
      t.belongs_to :city
      t.string :neighborhood
      t.string :cuisine_type
      t.string :description

      t.timestamps
    end
  end
end
