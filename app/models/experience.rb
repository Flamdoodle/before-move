class Experience < ActiveRecord::Base
  has_many :dining_options
  has_many :restaurants, through: :dining_options
  validates :type, presence: true, uniqueness: true

  accepts_nested_attributes_for :restaurants, :dining_options
end
