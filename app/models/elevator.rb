require 'twilio-ruby'

class Elevator < ApplicationRecord
  belongs_to :column
  
  after_commit do
    if status == 'intervention'
      sendSMS()
    end
  end


  # sendSMS uses twilio API to send sms
  def sendSMS() 
    require 'twilio-ruby'

    # Your Account Sid and Auth Token from twilio.com/console
    # DANGER! This is insecure. See http://twil.io/secure

    @client = Twilio::REST::Client.new(ENV['TWILIO_API'], ENV['TWILIO_AUTH'])

    message = @client.messages
    .create(
      body: "Status of elevator number #{self.id} of column number #{self.column.id} of battery number #{self.column.battery.id} of building at #{self.column.battery.building.address.number_street} in #{self.column.battery.building.address.city} passed to 'intervention' ",
      from: ENV['phone_sender'],
      to: ENV['phone_recipient'] #CHANGER POUR NUM Dun COACH
    )

    puts message.sid
  end

<<<<<<< HEAD
    #  before_save do
    #    notification()
    #   end
    #  def notification 
    #    notifier = Slack::Notifier.new ENV["slackAPI"] do
    #      defaults channel: "#elevator_operations",
    #              username: "TeamRaph"
    #    end
=======
     before_save do
      if((status != status_was) and (status_was != nil))
       notification()
      end
      end
     def notification 
       notifier = Slack::Notifier.new ENV["slackAPI"] do
         defaults channel: "#elevator_operations",
                 username: "TeamRaph"
       end
>>>>>>> a81dc18c3c0e32e112e46982cdf82930ca0b3098
      
    #    notifier.ping "The Elevator #{self.id} with serial number #{self.serial_number} changed status from #{self.status_was} to #{self.status}"
    #  end


end
