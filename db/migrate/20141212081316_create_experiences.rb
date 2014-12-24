class CreateExperiences < ActiveRecord::Migration
  def change
    create_table :experiences do |t|
      t.string :type
      t.decimal :minimum_spend

      t.timestamps
    end
  end
end
