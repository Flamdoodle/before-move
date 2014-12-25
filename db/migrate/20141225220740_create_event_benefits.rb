class CreateEventBenefits < ActiveRecord::Migration
  def change
    create_table :event_benefits do |t|
      t.string :benefit
      t.belongs_to :event

      t.timestamps
    end
  end
end
