class DiningOption < ActiveRecord::Base
  has_many :experiences
  belongs_to :restaurant
end
