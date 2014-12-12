class MenuItem < ActiveRecord::Base
  validates_presence_of :name

  belongs_to :menu
end
