class DiningOption < ActiveRecord::Base
  belongs_to :restaurant
  belongs_to :experience
end
