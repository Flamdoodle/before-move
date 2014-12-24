class City < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true
  validates :state, presence: true, uniqueness: true

  has_many :restaurants
end