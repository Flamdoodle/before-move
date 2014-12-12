class CreateDiningOptions < ActiveRecord::Migration
  def change
    create_table :dining_options do |t|
      belongs_to :restaurant
      belongs_to :experience

      t.timestamps
    end
  end
end
