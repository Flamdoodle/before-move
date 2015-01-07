class Booking < ActiveRecord::Base
  belongs_to :user
  belongs_to :event
  has_many :booked_guests
  validates_presence_of :number_of_tickets

end
