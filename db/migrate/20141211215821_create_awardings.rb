class CreateAwardings < ActiveRecord::Migration
  def change
    create_table :awardings do |t|
      t.belongs_to :restaurant
      t.belongs_to :accolade

      t.timestamps
    end
  end
end
