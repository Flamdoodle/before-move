class Experience < ActiveRecord::Base
  belongs_to :dining_option
  has_many :events
end
