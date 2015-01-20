class Benefit < ActiveRecord::Base
  has_many :event_benefits
  has_many :events, through: :event_benefits
end
