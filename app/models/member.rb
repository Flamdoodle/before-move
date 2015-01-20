class Member < ActiveRecord::Base
  has_secure_password

  validates_presence_of :first_name, :last_name,
    :email, :password, :street_address, :city, :state, :zipcode, :phone_number,
    :referral_code, :membership_cost
  validates_uniqueness_of :email, :referral_code
  validates :is_admin?, inclusion: { in: [true, false] }
  validates :is_active?, inclusion: { in: [true, false] }

  has_many :bookings
  has_many :events, through: :bookings
  has_many :referrals
  has_many :earnings
  has_many :tastepoints, through: :earnings

  accepts_nested_attributes_for :referrals, :earnings, :tastepoints

  def name
    "#{self.first_name} #{self.last_name}"
  end
end