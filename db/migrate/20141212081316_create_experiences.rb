class CreateExperiences < ActiveRecord::Migration
  def change
    create_table :experiences do |t|
      t.string :space_option
      t.decimal :minimum_spend
      t.integer :number_of_seats
      t.belongs_to :dining_option

      t.timestamps
    end
  end
end
