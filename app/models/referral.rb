class Referral < ActiveRecord::Base
  validates_presence_of :type

  belongs_to :user
end
