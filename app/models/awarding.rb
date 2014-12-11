class Awarding < ActiveRecord::Base
  belongs_to :accolade
  belonts_to :restaurant
end
