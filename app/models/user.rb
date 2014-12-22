class User < ActiveRecord::Base
  validates_presence_of :first_name, :last_name,
    :email, :password, :address, :zipcode, :phone_number,
    :referral_code, :membership_cost, :is_active?, :is_admin?
  validates_uniqueness_of :email, :referral_code

  has_many :bookings
  has_many :events, through: :bookings
  has_many :referrals
  has_many :earnings
  has_many :tastepoints, through: :earnings
end