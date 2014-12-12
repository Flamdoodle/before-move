class CreateBookings < ActiveRecord::Migration
  def change
    create_table :bookings do |t|
      t.belongs_to :user
      t.integer :number_of_tickets
      t.belongs_to :event

      t.timestamps
    end
  end
end
