class CreateDiningOptions < ActiveRecord::Migration
  def change
    create_table :dining_options do |t|
      t.decimal :required_deposit, precision: 3, scale: 2
      t.decimal :admin_fee, precision: 3, scale: 2
      t.belongs_to :restaurant

      t.timestamps
    end
  end
end
