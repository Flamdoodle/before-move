class SpaceOption < ActiveRecord::Base
  has_many :events
  has_many :restaurant_space_options
  has_many :restaurants, through: :restaurant_space_options
end
