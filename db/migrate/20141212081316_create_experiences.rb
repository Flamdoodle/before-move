class CreateExperiences < ActiveRecord::Migration
  def change
    create_table :experiences do |t|
      t.string :space_option
      t.decimal :minimum_spend

      t.timestamps
    end
  end
end
