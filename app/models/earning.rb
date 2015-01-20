class Earning < ActiveRecord::Base
  belongs_to :member
  belongs_to :tastepoint
end
