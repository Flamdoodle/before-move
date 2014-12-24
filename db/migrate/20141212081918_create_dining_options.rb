class CreateDiningOptions < ActiveRecord::Migration
  def change
    create_table :dining_options do |t|
      t.decimal :required_deposit
      t.decimal :admin_fee, precision: 3, scale: 2
      t.belongs_to :restaurant
      t.belongs_to :experience

      t.timestamps
    end
  end
end
