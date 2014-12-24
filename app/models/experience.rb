class Experience < ActiveRecord::Base
  belongs_to :dining_options

  accepts_nested_attributes_for :restaurants, :dining_options
end
