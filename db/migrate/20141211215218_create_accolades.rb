class CreateAccolades < ActiveRecord::Migration
  def change
    create_table :accolades do |t|
      t.string :name

      t.timestamps
    end
  end
end
