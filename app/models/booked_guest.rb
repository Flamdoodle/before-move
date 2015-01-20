class BookedGuest < ActiveRecord::Base
  belongs_to :booking
end
