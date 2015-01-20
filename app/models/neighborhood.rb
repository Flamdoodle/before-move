class Neighborhood < ActiveRecord::Base
  belongs_to :city
  has_many :restaurants
  has_many :events, through: :restaurants
end
