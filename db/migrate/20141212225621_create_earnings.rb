class CreateEarnings < ActiveRecord::Migration
  def change
    create_table :earnings do |t|
      t.belongs_to :member
      t.belongs_to :tastepoint

      t.timestamps
    end
  end
end
