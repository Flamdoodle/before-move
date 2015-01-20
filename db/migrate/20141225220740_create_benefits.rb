class CreateBenefits < ActiveRecord::Migration
  def change
    create_table :benefits do |t|
      t.string :benefit

      t.timestamps
    end
  end
end
