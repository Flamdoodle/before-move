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
      t.string :gratuity
      t.string :admin_fee
      t.string :required_deposit

      t.timestamps
    end
  end
end
