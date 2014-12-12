class CreateMenus < ActiveRecord::Migration
  def change
    create_table :menus do |t|
      t.belongs_to :event
      t.integer :number_of_courses
      t.string :name
      t.string :description

      t.timestamps
    end
  end
end
