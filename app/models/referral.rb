class Referral < ActiveRecord::Base
  validates_presence_of :referral_type

  belongs_to :member
end
