class Restaurant < ActiveRecord::Base
  validates_presence_of :name, :street_address, :zipcode, :description

  has_many :events
  has_many :accolades
  has_many :contacts
  has_many :restaurant_space_options
  has_many :space_options, through: :restaurant_space_options
  belongs_to :city
  belongs_to :neighborhood
  belongs_to :cuisine_type

  accepts_nested_attributes_for :accolades, :contacts, :restaurant_space_options, :space_options
end