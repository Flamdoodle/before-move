class Member < ActiveRecord::Base
  has_secure_password

  before_validation :create_referral_code, on: :create

  validates_presence_of :first_name, :last_name,
    :email, :zipcode, :phone_number, :referral_code
  validates :password, confirmation: true, on: :create
    # :city, :state, :membership_cost, :street_address
  validates_uniqueness_of :email, :referral_code
  # validates :is_admin?, inclusion: { in: [true, false] }
  # validates :is_active?, inclusion: { in: [true, false] }

  has_many :bookings
  has_many :events, through: :bookings
  has_many :referrals
  has_many :earnings
  has_many :tastepoints, through: :earnings

  accepts_nested_attributes_for :referrals, :earnings, :tastepoints

  def name
    "#{self.first_name} #{self.last_name}"
  end

  def tweet(tweet)
    client = Twitter::REST::Client.new do |config|
      config.consumer_key        = ENV['TWITTER_CONSUMER_KEY']
      config.consumer_secret     = ENV['TWITTER_CONSUMER_SECRET']
      config.access_token        = self.twitter_token
      config.access_token_secret = self.twitter_token_secret
    end

    client.update(tweet)
  end

  protected

  def create_referral_code(counter = 0)
    counter += 1
    referral_code = "#{self.first_name}#{self.last_name}#{counter}"
    if Member.find_by(referral_code: referral_code)
      create_referral_code(counter)
    else
      self.referral_code = referral_code
    end
  end
end