class CreateEventBenefits < ActiveRecord::Migration
  def change
    create_table :event_benefits do |t|
      t.belongs_to :event
      t.belongs_to :benefit

      t.timestamps
    end
  end
end
