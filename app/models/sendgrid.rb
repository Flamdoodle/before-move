class Sendgrid
  attr_accessor :mail

  def initialize(from, to)
    @client = SendGrid::Client.new(api_user: ENV['SENDGRID_USERNAME'], api_key: ENV['SENDGRID_PASSWORD'])
    @mail = SendGrid::Mail.new do |m|
      m.to = to
      m.from = from
    end
  end

  def send
    @client.send(@mail)
  end
end