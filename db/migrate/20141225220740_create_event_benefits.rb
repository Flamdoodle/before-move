class CreateEventBenefits < ActiveRecord::Migration
  def change
    create_table :event_benefits do |t|
      t.string :benefit
      t.belongs_to :benefit

      t.timestamps
    end
  end
end
