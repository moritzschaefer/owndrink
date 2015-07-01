require 'sendgrid-ruby'


class EmailLib
  def self.send_apply_email drink

    client = SendGrid::Client.new(api_user: ENV['API_USER'], api_key: ENV['API_KEY'])


    mail = SendGrid::Mail.new do |m|
      m.to = drink.innovator_email
      m.from = 'inbound@owndrink.bymail.in'
      m.subject = 'Build found'
      m.text = 'Hey Hipster. A builder wants to realize your dream. Just respond "confirm" as text to this E-Mail and we will send him your money so he can start building.'
    end
    client.send(mail)
  end

  def self.send_confirmation_email drink, success
    client = SendGrid::Client.new(api_user: 'mollitz', api_key: 'hackathon1')


    mail = SendGrid::Mail.new do |m|
      m.to = drink.builder_email
      m.from = 'inbound@owndrink.bymail.in'
      if success
        m.subject = 'Creation Confirmed'
        m.text = 'Congratulations. The Hipster confirmed and the money should be on your side now. Create his drink and make him happy.'
      else
        m.subject = 'Failed'
        m.text = 'Hey. There was an error in the payment process. Please restart from zero'
      end
    end
    client.send(mail)
  end

  def self.email_callback params
    envelope = JSON.parse params['envelope']
    if envelope['text'].downcase.include? 'confirm' or envelope['subject'].downcase.include? 'confirm'
      drink = Drink.find_by! innovator_email: envelope['from']
      if BraintreeLib.transfer_money drink
        send_confirmation_email drink, true
      else
        send_confirmation_email drink, false
      end

    end

  end
end
