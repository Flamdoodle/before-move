class Earning < ActiveRecord::Base
  belongs_to :user
  belongs_to :tastepoint
end
