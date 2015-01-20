class CreateBookedGuests < ActiveRecord::Migration
  def change
    create_table :booked_guests do |t|
      t.belongs_to :booking
      t.string :name
      t.string :email

      t.timestamps
    end
  end
end
