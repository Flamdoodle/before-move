class Restaurant < ActiveRecord::Base
  validates_presence_of :name, :address, :description

  has_many :events
  belongs_to :city
end