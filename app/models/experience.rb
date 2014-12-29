class Experience < ActiveRecord::Base
  belongs_to :dining_options
  has_many :events
end
