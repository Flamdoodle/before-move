class CreateExperiences < ActiveRecord::Migration
  def change
    create_table :experiences do |t|
      t.string :type

      t.timestamps
    end
  end
end
