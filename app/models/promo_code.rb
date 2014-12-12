class PromoCode < ActiveRecord::Base
  validates_presence_of :expiration_date, :membership_price, :code
  validates_uniqueness_of :code
end
