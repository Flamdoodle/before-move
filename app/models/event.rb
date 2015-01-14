class Event < ActiveRecord::Base
  validates_presence_of :time, :date, :number_of_seats,
    :seat_cost, :max_tickets_per_member

  belongs_to :restaurant
  belongs_to :space_option
  has_many :bookings
  has_many :users, through: :bookings # member who booked event, consider aliasing
  has_many :menus
  has_many :menu_items, through: :menus
  has_many :event_benefits
  has_many :benefits, through: :event_benefits

  accepts_nested_attributes_for :menus, :menu_items, :benefits
end