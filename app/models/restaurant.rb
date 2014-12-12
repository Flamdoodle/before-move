class Restaurant < ActiveRecord::Base
  validates_presence_of :name, :address, :description

  has_many :events
  has_many :awardings
  has_many :accolades, through: :awardings
  has_many :contacts
  has_many :dining_options
  has_many :experiences, through: :dining_options
  belongs_to :city
end