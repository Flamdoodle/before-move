class CreateMenuItems < ActiveRecord::Migration
  def change
    create_table :menu_items do |t|
      t.belongs_to :event
      t.integer :course_number
      t.string :name
      t.string :description

      t.timestamps
    end
  end
end
