class City < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true
  validates :state, presence: true

  belongs_to :state
  has_many :restaurants
end