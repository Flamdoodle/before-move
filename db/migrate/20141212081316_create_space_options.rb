class CreateSpaceOptions < ActiveRecord::Migration
  def change
    create_table :space_options do |t|
      t.string :space_option

      t.timestamps
    end
  end
end
