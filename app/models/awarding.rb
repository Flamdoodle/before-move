class Awarding < ActiveRecord::Base
  belongs_to :accolade
  belongs_to :restaurant
end
