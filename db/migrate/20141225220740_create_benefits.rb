class CreateBenefits < ActiveRecord::Migration
  def change
    create_table :benefits do |t|
      t.string :benefit
      t.belongs_to :event

      t.timestamps
    end
  end
end
