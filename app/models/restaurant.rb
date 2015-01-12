class Restaurant < ActiveRecord::Base
  validates_presence_of :name, :street_address, :zipcode, :description

  has_many :events
  has_many :awardings
  has_many :accolades, through: :awardings
  has_many :contacts
  has_many :space_options
  belongs_to :city

  accepts_nested_attributes_for :awardings, :accolades, :contacts, :experiences
end