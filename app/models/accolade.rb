class Accolade < ActiveRecord::Base
  has_many :awardings
  has_many :restaurants, through: :awardings
end
