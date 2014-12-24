class DiningOption < ActiveRecord::Base
  has_many :experiences
  belongs_to :restaurant

  accepts_nested_attributes_for :experiences
end
