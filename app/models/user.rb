class User < ActiveRecord::Base
  validates_presence_of :first_name, :last_name,
    :email, :password, :address, :zipcode, :phone_number,
    :referral_code, :membership_cost, :admin_status, :active_status
  validates_uniqueness_of :email, :referral_code

  has_many :bookings
  has_many :events, through: :bookings
end