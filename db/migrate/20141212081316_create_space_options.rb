class CreateSpaceOptions < ActiveRecord::Migration
  def change
    create_table :space_options do |t|
      t.string :space_option
      t.decimal :minimum_spend
      t.integer :number_of_seats

      t.timestamps
    end
  end
end
