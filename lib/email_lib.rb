require 'sendgrid-ruby'

class EmailLib
  def self.send_apply_email drink

    client = SendGrid::Client.new(api_user: 'mollitz', api_key: 'hackathon1')


    mail = SendGrid::Mail.new do |m|
      m.to = drink.innovator_email
      m.from = 'inbound@owndrink.bymail.in'
      m.subject = 'Build found'
      m.text = 'Hey Hipster. A builder wants to realize your dream. Just respond "confirm" as text to this E-Mail and we will send him your money so he can start building.'
    end
    client.send(mail)
  end

  def self.send_confirmation_email drink
    client = SendGrid::Client.new(api_user: 'mollitz', api_key: 'hackathon1')


    mail = SendGrid::Mail.new do |m|
      m.to = drink.bulder_email
      m.from = 'inbound@owndrink.bymail.in'
      m.subject = 'Creation Confirmed'
      m.text = 'Congratulations. The Hipster confirmed and the money should be on your side now. Create his drink and make him happy.'
    end
    client.send(mail)
  end

  def self.email_callback params
    Rails.logger.info params.keys.to_s
  end
end
