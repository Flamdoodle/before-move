class Event < ActiveRecord::Base
  validates_presence_of :date, :number_of_seats,
    :seat_cost, :max_tickets_per_member

  belongs_to :restaurant
end