class CreateRestaurants < ActiveRecord::Migration
  def change
    create_table :restaurants do |t|
      t.string :name
      t.string :street_address
      t.string :zipcode
      t.belongs_to :city
      t.string :neighborhood
      t.string :cuisine_type
      t.string :description
      t.decimal :gratuity, precision: 3, scale: 2

      t.timestamps
    end
  end
end
