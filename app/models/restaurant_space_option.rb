class RestaurantSpaceOption < ActiveRecord::Base
  belongs_to :restaurant
  belongs_to :space_option
  has_many :events

  accepts_nested_attributes_for :space_option
end
