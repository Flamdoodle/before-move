class CreateRestaurants < ActiveRecord::Migration
  def change
    create_table :restaurants do |t|
      t.string :name
      t.string :street_address
      t.string :zipcode
      t.belongs_to :city
      t.belongs_to :neighborhood
      t.belongs_to :cuisine_type
      t.string :description
      t.string :gratuity
      t.string :admin_fee
      t.string :required_deposit
      t.string :image

      t.timestamps
    end
  end
end
