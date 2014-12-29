class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.date :date
      t.time :time
      t.integer :number_of_seats
      t.belongs_to :restaurant
      t.decimal :seat_cost
      t.integer :max_tickets_per_member
      t.string :nonmember_code
      t.belongs_to :experience

      t.timestamps
    end
  end
end
