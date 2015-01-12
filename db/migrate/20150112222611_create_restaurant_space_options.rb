class CreateRestaurantSpaceOptions < ActiveRecord::Migration
  def change
    create_table :restaurant_space_options do |t|
      belongs_to :restaurant
      belongs_to :space_option
      t.integer :number_of_seats
      t.string :minimum_spend

      t.timestamps
    end
  end
end
