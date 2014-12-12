class Menu < ActiveRecord::Base
  validates_presence_of :name

  belongs_to :event
  has_many :menu_items
end
