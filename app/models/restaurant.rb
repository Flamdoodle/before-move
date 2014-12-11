class Restaurant < ActiveRecord::Base
  validates_presence_of :name, :address, :description

  has_many :events
  has_many :awardings
  has_many :accolades, through: :awardings
  has_many :contacts
  belongs_to :city
end