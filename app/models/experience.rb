class Experience < ActiveRecord::Base
  has_many :dining_options
  has_many :restaurants, through: :dining_options
  validates :space_option, presence: true, uniqueness: true
  validates :minimum_spend, presence: true, uniqueness: true

  accepts_nested_attributes_for :restaurants, :dining_options
end
