class Tastepoint < ActiveRecord::Base
  validates_presence_of :amount, :earned_by
  validates_uniqueness_of :earned_by

  has_many :earnings
  has_many :users, through: :earnings

  accepts_nested_attributes_for :earnings
end
