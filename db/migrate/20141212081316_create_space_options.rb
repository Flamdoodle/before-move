class CreateSpaceOptions < ActiveRecord::Migration
  def change
    create_table :space_options do |t|
      t.string :name

      t.timestamps
    end
  end
end
