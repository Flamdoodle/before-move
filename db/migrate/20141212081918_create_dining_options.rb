class CreateDiningOptions < ActiveRecord::Migration
  def change
    create_table :dining_options do |t|
      t.belongs_to :restaurant
      t.belongs_to :experience

      t.timestamps
    end
  end
end
